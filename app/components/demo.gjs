import { template as buildTimeProbably } from '@ember/template-compiler';
import { template } from '@ember/template-compiler/runtime';

const greeting = 'folks';

const Foo = template('Hello, {{greeting}}', {
  strict: true,
  scope: () => ({
    greeting,
  })
});

const Bar = template('Bar: <Foo />', {
  eval: function () {
    return eval(arguments[0]);
  },
});

const WithBlock = template('{{yield}}');
const BlockWithYields = template('{{yield greeting}}', {
  strict: true,
  scope: () => ({
    greeting,
  })
});


const PreBuilt = buildTimeProbably('Built by tooling {{greeting}}', {
  strict: true,
  scope: () => ({
    greeting,
  })
});

console.log({ Foo, Bar, template });

const Demo = <template>
  <fieldset><legend>{{@name}}</legend>
    {{yield}}
  </fieldset>
</template>;

<template>
  hi.
  <Demo @name="Bar"><Bar /></Demo>
  <Demo @name="Foo"><Foo /></Demo>
  <Demo @name="WithBlock">
    <WithBlock>had a block passed</WithBlock> <br />
  </Demo>
  <Demo @name="PreBuilt"><PreBuilt /></Demo>
  <Demo @name="BlockWithYields">
    <BlockWithYields as |greeting|>
      Hello, "{{greeting}}" &lt;- should not be empty
    </BlockWithYields>
  </Demo>
</template>
