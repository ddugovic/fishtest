<%inherit file="base.mak"/>

<% re_run = len(args) > 0 %>

<form class="form-horizontal" action="${request.url}" method="POST">
  <legend>Create New Test</legend>
  Please read the <a href="https://github.com/ddugovic/Stockfish/wiki/Creating-my-first-test">Testing Guidelines</a> before
  creating your test.

  <br><br>
  <div class="control-group">
    <label class="control-label">Test type:</label>
    <div class="controls">
      <select name="test_type">
        <option value="Standard">Standard</option>
        <option value="Regression">Regression</option>
      </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Variant:</label>
    <div class="controls">
      <select name="variant">
        <option value="standard">Chess</option>
        <option value="giveaway">Giveaway (Antichess)</option>
        <option value="atomic">Atomic</option>
        <option value="crazyhouse">Crazyhouse</option>
        <option value="extinction">Extinction</option>
        <option value="grid">Grid</option>
        <option value="horde">Horde</option>
        <option value="kingofthehill">King of the Hill</option>
        <option value="losers">Losers</option>
        <option value="racingkings">Racing Kings</option>
        <option value="seirawan">Seirawan (S-Chess)</option>
        <option value="shatranj">Shatranj</option>
        <option value="3check">Three-check</option>
        <option value="twokings">Two Kings</option>
        <option value="displacedgrid">Displaced Grid</option>
        <option value="loop">Loop</option>
        <option value="slippedgrid">Slipped Grid</option>
        <option value="suicide">Suicide</option>
        <option value="twokingssymmetric">Symmetric Two Kings</option>
      </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Test branch:</label>
    <div class="controls">
      <input name="test-branch" value="${args.get('new_tag', '')}" ${'readonly' if re_run else ''}>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Test options:</label>
    <div class="controls">
    <input name="new-options" value="${args.get('new_options', 'Hash=4 Move Overhead=100')}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Test signature:</label>
    <div class="controls">
      <input name="test-signature" value="${args.get('new_signature', '')}" ${'readonly' if re_run else ''}>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Base branch:</label>
    <div class="controls">
      <input name="base-branch" value="${args.get('base_tag', 'master')}" ${'readonly' if re_run else ''}>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Base options:</label>
    <div class="controls">
    <input name="base-options" value="${args.get('base_options', 'Hash=4 Move Overhead=100')}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Base signature:</label>
    <div class="controls">
      <input name="base-signature" value="${args.get('base_signature', '')}" ${'readonly' if re_run else ''}>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Stop rule:</label>
    <div class="controls">
      <select name="stop_rule">
        <option value="sprt">SPRT</option>
        <option value="numgames">NumGames</option>
        <option value="spsa">SPSA</option>
      </select>
    </div>
  </div>
  <div class="control-group stop_rule numgames spsa">
    <label class="control-label">Number of games:</label>
    <div class="controls">
      <input name="num-games" value="${args.get('num_games', 10000)}">
    </div>
  </div>
  <div class="control-group stop_rule sprt">
    <label class="control-label">SPRT bounds:</label>
    <div class="controls">
      <select name="bounds">
        <option value="std">Standard [0,10]</option>
        <option value="simpl">Simplification [-10,5]</option>
        <option value="custom">Custom...</option>
      </select>
    </div>
  </div>
  <div class="control-group stop_rule sprt custom_bounds">
    <label class="control-label">SPRT Elo0:</label>
    <div class="controls">
      <input name="sprt_elo0" value="${args.get('sprt', {'elo0': 0})['elo0']}">
    </div>
  </div>
  <div class="control-group stop_rule sprt custom_bounds">
    <label class="control-label">SPRT Elo1:</label>
    <div class="controls">
      <input name="sprt_elo1" value="${args.get('sprt', {'elo1': 10})['elo1']}">
    </div>
  </div>
  <div class="control-group stop_rule spsa">
    <label class="control-label">SPSA A:</label>
    <div class="controls">
			<input name="spsa_A" value="${args.get('spsa', {'A': 5000})['A']}">
    </div>
  </div>
  <div class="control-group stop_rule spsa">
    <label class="control-label">SPSA Gamma:</label>
    <div class="controls">
			<input name="spsa_gamma" value="${args.get('spsa', {'gamma': 0.101})['gamma']}">
    </div>
  </div>
  <div class="control-group stop_rule spsa">
    <label class="control-label">SPSA Alpha:</label>
    <div class="controls">
			<input name="spsa_alpha" value="${args.get('spsa', {'alpha': 0.602})['alpha']}">
    </div>
  </div>
  <div class="control-group stop_rule spsa">
    <label class="control-label">SPSA parameters:</label>
    <div class="controls">
      <textarea name="spsa_raw_params" class="span6">${args.get('spsa', {'raw_params': """Aggressiveness,30,0,200,10,0.0020
Cowardice,150,0,200,10,0.0020"""})['raw_params']}</textarea>
    </div>
  </div>
  <div class="control-group stop_rule spsa">
    <label class="control-label">SPSA clipping:</label>
    <div class="controls">
      <select name="spsa_clipping">
        <option value="old">old</option>
        <option value="careful">careful</option>
      </select>
    </div>
  </div>
  <div class="control-group stop_rule spsa">
    <label class="control-label">SPSA rounding:</label>
    <div class="controls">
      <select name="spsa_rounding">
        <option value="deterministic">deterministic</option>
        <option value="randomized">randomized</option>
      </select>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Time Control:</label>
    <div class="controls">
      <input name="tc" value="${args.get('tc', '10+0.1')}">
      <div class="btn-group">
        <div class="btn" id="fast_test">Fast</div>
        <div class="btn" id="slow_test">Slow</div>
      </div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Threads:</label>
    <div class="controls">
      <input name="threads" value="${args.get('threads', 1)}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Book:</label>
    <div class="controls">
      <input name="book" value="${args.get('book', 'chess.epd')}">
      <div class="btn-group">
        <div class="btn" id="auto_book">auto</div>
      </div>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Book Depth:</label>
    <div class="controls">
      <input name="book-depth" value="${args.get('book_depth', 8)}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Advanced:</label>
    <div class="controls checkbox inline">
      <input name="auto-purge" type="checkbox" checked="checked" value="True">Auto-purge
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Priority:</label>
    <div class="controls">
      <input name="priority" value="${args.get('priority', 0)}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Throughput:</label>
    <div class="controls">
      <input name="throughput" value="${args.get('throughput', 400)}">
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Test Repo:</label>
    <div class="controls">
      <input name="tests-repo" value="${args.get('tests_repo', tests_repo)}" ${'readonly' if re_run else ''}>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">Notes:</label>
    <div class="controls">
      <textarea name="run-info" class="span4">${args.get('info', '')}</textarea>
    </div>
  </div>

  %if 'resolved_base' in args:
    <input type="hidden" name="resolved_base" value="${args['resolved_base']}">
    <input type="hidden" name="resolved_new" value="${args['resolved_new']}">
    <input type="hidden" name="msg_base" value="${args.get('msg_base', '')}">
    <input type="hidden" name="msg_new" value="${args.get('msg_new', '')}">
  %endif

  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>

<script type="text/javascript">
$(function() {
  var update_bounds = function() {
    var bounds = $('select[name=bounds]').val();
    if (bounds == 'std') { $('input[name=sprt_elo0]').val('0'); $('input[name=sprt_elo1]').val('10'); }
    if (bounds == 'simpl') { $('input[name=sprt_elo0]').val('-10'); $('input[name=sprt_elo1]').val('5'); }
    if (bounds == 'custom')
      $('.custom_bounds').show();
    else
      $('.custom_bounds').hide();
  };
  var update_visibility = function() {
    $('.stop_rule').hide();
    var stop_rule = $('select[name=stop_rule]').val();
    if (stop_rule == 'numgames') $('.numgames').show();
    if (stop_rule == 'sprt') { $('.sprt').show(); update_bounds(); }
    if (stop_rule == 'spsa') $('.spsa').show();
  };

  $('select[name=variant]').val("${args.get('variant', 'standard')}");
  $('select[name=stop_rule]').val("${'sprt' if not re_run or 'sprt' in args else 'spsa' if 'spsa' in args else 'numgames'}");

  $('select[name=bounds]').val("${'custom' if re_run else 'std'}");
  update_visibility();
  $('select[name=stop_rule]').change(update_visibility);
  $('select[name=bounds]').change(update_bounds);

  $('#fast_test').click(function() {
    $('input[name=tc]').val('10+0.1');
    $('input[name=new-options]').val('Hash=4 Move Overhead=100');
    $('input[name=base-options]').val('Hash=4 Move Overhead=100');
  });

  $('#slow_test').click(function() {
    $('input[name=tc]').val('30+0.3');
    $('input[name=new-options]').val('Hash=32 Move Overhead=100');
    $('input[name=base-options]').val('Hash=32 Move Overhead=100');
  });

  $('#auto_book').click(function() {
    var variant = $('select[name=variant]').val();
    var bookname;
    switch (variant) {
        case "standard":
            bookname = "chess.epd";
            break;
        default:
            bookname = variant + ".epd";
            break;
    }
    $('input[name=book]').val(bookname);
  });
});
</script>
