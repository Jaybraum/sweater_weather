require 'rails_helper'

RSpec.describe LocationService do
  describe 'class methods' do
      describe '::get_location_details' do
        it 'returns location data' do
          response = LocationService.get_location_details("Brooklyn, NY")

          expect(response).to be_a Hash
          expect(response[:results]).to be_an Array

          brooklyn = response[:results][:locations].first

          expect(brooklyn[:latLng]).to be_a Hash
          expect(brooklyn[:latLng].count).to eq(2)

          expect(brooklyn[:latLng][:lat]).to be_a(Float)
          expect(brooklyn[:latLng][:lng]).to be_a(Float)

          expect(brooklyn[:latLng][:lat]).to eq(40.692529)
          expect(brooklyn[:latLng][:lng]).to eq(-73.990996)
        end
      end
    end

    describe '::random_cocktail' do
      xit 'returns data for a random cocktail' do
        response = CocktailService.random_cocktail

        expect(response).to be_a Hash
        expect(response[:drinks]).to be_an Array

        cocktail = response[:drinks].first

        expect(cocktail[:idDrink]).to be_a String
        expect(cocktail[:strDrink]).to be_a String
        expect(cocktail[:strInstructions]).to be_a String
        expect(cocktail[:strDrinkThumb]).to be_a String
        expect(cocktail[:strIngredient1]).to be_a String
        expect(cocktail[:strMeasure1]).to be_a String
      end
    end

    describe '::search_cocktails' do
      xit 'returns search results' do
        response = CocktailService.search_cocktails('vodka')

        expect(response).to be_a Hash
        expect(response[:drinks]).to be_an Array

        long_vodka = response[:drinks].first

        expect(long_vodka).to be_a Hash
        expect(long_vodka[:idDrink]).to eq('13196')
        expect(long_vodka[:strDrink]).to eq('Long vodka')
        expect(long_vodka[:strDrinkThumb]).to eq('https://www.thecocktaildb.com/images/media/drink/9179i01503565212.jpg')

        vodka_and_tonic = response[:drinks].second

        expect(vodka_and_tonic).to be_a Hash
        expect(vodka_and_tonic[:idDrink]).to eq('16967')
        expect(vodka_and_tonic[:strDrink]).to eq('Vodka Fizz')
        expect(vodka_and_tonic[:strDrinkThumb]).to eq('https://www.thecocktaildb.com/images/media/drink/xwxyux1441254243.jpg')
      end
    end
  end
