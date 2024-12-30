//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 06/05/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text("-")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    Text("Miami, Florida")
                    
                }
                .font(.caption)
            }
            /* TODO: Keep for leading alignment */
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    HStack {
                        Text("4 guests - ")
                        Text("4 bedrooms - ")
                        Text("4 beds - ")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                
                Image("listing-8")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(.circle)
                
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(0..<2) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Superhosts are experience, highly rated hosts who are commited to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(1..<5) { item in
                            VStack(alignment: .leading, spacing: 4) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(item)")
                                    .font(.footnote)
                            }
                            .frame(width: 132, height: 100, alignment: .leading)
                            .padding(.horizontal, 10)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offer")
                    .font(.headline)
                ForEach(0..<5) { item in
                    HStack {
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.caption)
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom, 70)
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .padding(32)
                    .padding(.top, -32)
            }
        }
        .overlay(alignment: .bottom) {
            VStack {
               Divider()
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .underline()
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
        
        
    }
}

#Preview {
    ListingDetailView()
}
