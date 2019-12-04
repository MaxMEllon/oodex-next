import React from 'react'

export default function ProblemContents({ contents }) {
  console.log(contents)
  return (
    <div>
      <div>
        <h1>{contents.name}</h1>
      </div>
      <div>
        <p>{contents.detail}</p>
      </div>
    </div>
  )
}