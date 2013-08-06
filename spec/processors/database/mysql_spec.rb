require 'spec_helper'
require 'restore/processors/database/mysql'

describe Restore::Processor::Database::MySQL do

  let(:backup_path){ '/my/backup.sql' }

  context 'everything set' do

    before do
      config = {
        :username => 'foo',
        :password => 'bar',
        :database => 'stuff',
        :drop => true,
        :create => true
      }
      @subject = Restore::Processor::Database::MySQL.new(config)
      @subject.stub(:execute)
    end

  end

  context 'username and password not set' do

    before do
      config = {
        :database => 'stuff',
        :drop => true,
        :create => true
      }
      @subject = Restore::Processor::Database::MySQL.new(config)
      @subject.stub(:execute)
    end

    it 'should exclude username and password from the command' do
      @subject.should_receive(:execute).with("mysql stuff < /my/backup.sql")
      @subject.process(backup_path)
    end

  end

  context 'drop and create not set' do

    before do
      config = {
        :username => 'foo',
        :password => 'bar',
        :database => 'stuff',
      }
      @subject = Restore::Processor::Database::MySQL.new(config)
      @subject.stub(:execute)
    end

    it 'should not drop the database' do
      @subject.should_not_receive(:execute).with("mysql --user=foo --password=bar --execute='drop database stuff'")
      @subject.process(backup_path)
    end

    it 'should not create the database' do
      @subject.should_not_receive(:execute).with("mysql --user=foo --password=bar --execute='create database stuff'")
      @subject.process(backup_path)
    end

  end

  context 'database not set' do

    it 'should raise an argument error' do
      config = {
        :username => 'foo',
        :password => 'bar',
        :drop => true,
        :create => true
      }
      expect do
        @subject = Restore::Processor::Database::MySQL.new(config)
      end.to raise_error ArgumentError
    end

  end

end
