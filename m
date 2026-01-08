Return-Path: <linux-kbuild+bounces-10443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9CD01B8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 08 Jan 2026 10:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BEE8B300647A
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jan 2026 09:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D36379976;
	Thu,  8 Jan 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qy4mpL6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jm1+86Fj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qy4mpL6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jm1+86Fj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D637996B
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Jan 2026 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861532; cv=none; b=E6z/LTpwLVa1FgNu/bv86Ru8+0v6f+Q+EsZnYI5ssPNkbW/l6TAxWXwDtg0jKkYXGYdh0AInLcUw0UhwGvbJHUydnJOXzvfsfgbMsN6G7nz0NtwVUmeq/I9SUlsWcCslmTdFhz8xY5sIUHRqY3TJHkmQt1YnSJdaxfjnTLCPyio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861532; c=relaxed/simple;
	bh=zlfQEdkD4NUE+oFzYzeoqSK3U9HEWLgMJm+KUOkFL64=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ay30dEo+dvZZ/2QqQBQB5tVk3BTbH1ygBMFL7w2BJopKhhyTpzSlhBH/4b2y0ti+PGdQ3pPnkRG02RM6IucoyYlaqvvlts5BarT/2FrxoLxUMVlrq/jj5+ES0BdGrlypGjfaKsry8WJ3R9lJBywQc1z2xHOktaUweStj9PvVsWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qy4mpL6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jm1+86Fj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qy4mpL6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jm1+86Fj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6478D33A99
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Jan 2026 08:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767861517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7XBpybX76c6WjgxIUiDHUJW3BIXpiVgaqWnop6VQGM=;
	b=Qy4mpL6eZ9rLUL87bY72VqF9nO1sMwOPUMR4WySLt7PcuGYCFgMMmJ/CI25X3Xyqvr7o/2
	2jDxAF1mB1kfNXbzgiRNN+Uc1arC8H8mAONAFXJg+1oUczzOTWmIcUatMbTV4fDKE+Nv2m
	ac3cGy9O7IsVIIQrq6q+ssY8/Dt0VyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767861517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7XBpybX76c6WjgxIUiDHUJW3BIXpiVgaqWnop6VQGM=;
	b=jm1+86FjDDcU7CKz7IdsrC9GvCe0Iq85K4DNwR7TknwNH7Llea9Q1+Lji2JmD8LHUhhIh+
	5c41RC3tWv889JDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767861517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7XBpybX76c6WjgxIUiDHUJW3BIXpiVgaqWnop6VQGM=;
	b=Qy4mpL6eZ9rLUL87bY72VqF9nO1sMwOPUMR4WySLt7PcuGYCFgMMmJ/CI25X3Xyqvr7o/2
	2jDxAF1mB1kfNXbzgiRNN+Uc1arC8H8mAONAFXJg+1oUczzOTWmIcUatMbTV4fDKE+Nv2m
	ac3cGy9O7IsVIIQrq6q+ssY8/Dt0VyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767861517;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7XBpybX76c6WjgxIUiDHUJW3BIXpiVgaqWnop6VQGM=;
	b=jm1+86FjDDcU7CKz7IdsrC9GvCe0Iq85K4DNwR7TknwNH7Llea9Q1+Lji2JmD8LHUhhIh+
	5c41RC3tWv889JDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44C3B3EA63
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Jan 2026 08:38:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VoNDDw1tX2l2aQAAD6G6ig
	(envelope-from <ddiss@suse.de>)
	for <linux-kbuild@vger.kernel.org>; Thu, 08 Jan 2026 08:38:37 +0000
Date: Thu, 8 Jan 2026 19:38:36 +1100
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scripts: headers_install: avoid some
 reprocessing
Message-ID: <20260108193836.06ac7228.ddiss@suse.de>
In-Reply-To: <20260107205239.6390-1-ddiss@suse.de>
References: <20260107205239.6390-1-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.23 / 50.00];
	BAYES_HAM(-2.98)[99.90%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.753];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-kbuild@vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.23

Here are the perf (perf stat -r 10) numbers I see with / without the v2
patches applied atop v6.19-rc4:

  $ cat bench.sh 
  touch scripts/headers_install.sh
  make O=/tmp/build_dir headers_install

  $ cat bench_j8.sh 
  touch scripts/headers_install.sh
  make -j8 O=/tmp/build_dir headers_install

        |    bench.sh        |   bench_j8.sh
--------+--------------------+---------------------
before  |  41.176 (+-0.28%)  |  2.58672 (+-0.28%)
--------+--------------------+---------------------
after   |  34.811 (+-1.35%)  |  2.33096 (+-0.39%)
--------+--------------------+---------------------

