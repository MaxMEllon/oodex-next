import React from 'react'
import { connect } from 'react-redux'
import { initializeProblemAndQuestionData } from '../../actions/exercise'
import TheProblems from './TheProblems'

class TheExercise extends React.Component {
  componentDidMount() {
    const { problemData, questionData, problemsWithTests, questionsWithTests } = this.props
    this.props.initializeProblemAndQuestionData({
      problemData,
      questionData,
      problemsWithTests,
      questionsWithTests
    })
  }

  render() {
    return (
      <div>
        <h1>The Exersice</h1>
        <TheProblems problemList={this.props.problems.problemList} />
      </div>
    )
  }
}

export default connect(
  state => ({
    problems: state.problems
  }),
  {
    initializeProblemAndQuestionData
  }
)(TheExercise)
