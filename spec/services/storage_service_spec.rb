# frozen_string_literal: true

require 'spec_helper'
require_relative '../../services/storage_service'

describe StorageService do
  subject { described_class.new }

  context '#commands' do
    it '<< increment the count' do
      expect do
        subject << { page: 'page', ip: '127.0.0.1' }
      end.to change { subject.count }.from(0).to(1)
    end
  end

  context '#queris' do
    before do
      subject << { page: 'page', ip: '127.0.0.1' }
      subject  << { page: 'page', ip: '127.0.0.1' }
      subject  << { page: 'other_page', ip: '127.0.0.1' }
      subject  << { page: 'other_page', ip: '127.0.0.2' }
    end
    it 'returns visit counts' do
      expect(subject.visit_count).to eq(
        [['page', 2],
         ['other_page', 2]]
      )
    end

    it 'returns unique visit counts' do
      expect(subject.unique_visit_count).to eq(
        [
          ['page', 1],
          ['other_page', 2]
        ]
      )
    end
  end
end
