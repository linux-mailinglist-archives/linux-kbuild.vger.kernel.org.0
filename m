Return-Path: <linux-kbuild+bounces-11356-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id le3iOpN+m2nO0QMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11356-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 23:09:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B471708D4
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 23:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A1E4300CC19
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 22:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FEF1EFF8D;
	Sun, 22 Feb 2026 22:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RjscmW0c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885542A96
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771798159; cv=none; b=I/kBVKYtB/M+jWocs3lZfICu3bl5fEck9EKqoPYvvtk50BE35hbR+Eg7QZ9Qc/DV13sGc28uEq+7dwTAXXcq6VmcK2KIcnd1baShRxvI8q3TSVFDqJAB/gQGofblsCRVZTDAwsiFeQCONveuAmmutANyaMmLv96LgGeFMWNXq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771798159; c=relaxed/simple;
	bh=gg2PGH5N2PSMcSrIj+okaGRyO9G+QKZikbs5CPWZtd4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gw/HrEC1hNaz/65S0lIaAzkcHUClpYzhCsTr8qf7k0nbZH8mXPNKb0wwCUTOhlh2cMgei4S7Mds8DhvlhRLqF2d3LMh3PLlSLBuMngz1Ba/hpUa3nAbt/6Nlo06TQHvMLJfVp+48aHFEuXIEoB45FR9q9C3ud6NNaAED/26lUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RjscmW0c; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8845cb5862so614266666b.3
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 14:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771798156; x=1772402956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0ux4ZEvZJ4hcsLckkohrc2GXPqcYNCw8BHTj7ezbd7U=;
        b=RjscmW0cWvfYjyqZbEPV6igcncbpXxQx7v0HunRA3/pXYmKvSlVs51SyT5jjq0cxPz
         AfLvWtXtLy0Yuc21qQciwUIUQBj2DIlEVB9LrB7cIpXjWyaOHviI4fEV2y2Onj9RHPoJ
         L3txiki1J8yQck3sjZGrtpIF2EEni1DJ3KazI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771798156; x=1772402956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ux4ZEvZJ4hcsLckkohrc2GXPqcYNCw8BHTj7ezbd7U=;
        b=fofat1aKxcHpq9eBM+z4IG2CWECISNupVm7dC4owbQ5m1+GpYPXSOocCUs1sJGIX76
         rUn1mY0B0/ZSODRroxyV9p6T4fEu08o7W+qL8x0MSkQSs3/xpKv8PrNElZN+0kL4QZRr
         fpwk51lE77sIeV2wlXVBiDBgXzhnBVDnlaCxkB1MWeLMJ5LftlQin8XCASlcCIlMJiuY
         Ut/na/pzM7W0i3+aLJl+XeusfcQPPFi7+UtNZNZ+VaYp6WoyoL60wD6QQs+gGyikT9n5
         fExSWVlDpF/e9+x3mP6hN5anNfPKIsPMEt9STdnFwJJHv6KwytcqwnMyGU2cLczdiVDU
         7jrw==
X-Forwarded-Encrypted: i=1; AJvYcCVc1VD4QirzphlTNzcW0Y7T3uDn9ddvn3JAtZUclNgQJ/38DXW00NfRM9TDTKl4Z4CDguR0tCE6QLdVz3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHhTJkfOchL8sYymZFMDFx1/Wr2Xy/waf89va4oDz4wjIb50/
	uERWNt6U4Bi+yRTTsZ6M4WtyZCQsPEyXWO2rnuwW+oRHNIBBZY2qao7fCf/VtBgJSUXp/aXuwWz
	GOcOU1E4=
X-Gm-Gg: AZuq6aJ8SyDrixI+/JydmihmGzYb0xtC0xr6KgcpK78szxaL/nfbg+LK45MsCSJj2rK
	y9a/WIQoLhUblhNzYVMrUz6BFo7U7jU7HI9bS7v7FYpHvYsSOWjNugTY5P4FCjEb++xfJEpYrF8
	zfK2xctMaeTBLOWzN+FL77GjdRHSS8tx4n912NLnTndFBAXRxBF7B3Q03P2HPXxtmDk7pc3eUur
	yyVun6DTl559j72UoPoAa4PDQMb4hYYKwUakTNSeH2fTux+asGSz9u9m3UvFOQuGyVZYdq9ZTP9
	pxNM5+JR4v5daNTP6NJNS/vgBMW6qBHaQEXFbkiyzdrj7Vjzo4G4O2vmWO5z6EySkASiAplJ6/p
	iwBmxxmjvwM9nU+EYIJK8XaKuUoeVOsE8Rcbn/Lt5Vldz7SD1eF63LTbKhxEStjF14dvsP624U3
	7XRq5PVbycwZW8qQ8CD1HzWZ4sEjaLH3vwEIXugAFoWW7UqpmDlPQSUy+2OY0VDYMZpHgCGA+8
X-Received: by 2002:a17:906:f586:b0:b8e:4790:d7c7 with SMTP id a640c23a62f3a-b908196f539mr411428966b.6.1771798155863;
        Sun, 22 Feb 2026 14:09:15 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4c38esm256293466b.34.2026.02.22.14.09.15
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 14:09:15 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8845cb5862so614265366b.3
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 14:09:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYfXXU+sxT+UP1DCrL0nRAYczbuE4XOisk7vLIFQzBUstTaOmgt0Xb4t6bLzscOvpBKd2J64jY6dZwbGI=@vger.kernel.org
X-Received: by 2002:a17:907:1c18:b0:b8f:6699:a036 with SMTP id
 a640c23a62f3a-b9081a2bfa6mr362521766b.19.1771798155202; Sun, 22 Feb 2026
 14:09:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Feb 2026 14:08:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
X-Gm-Features: AaiRm51pe-pZJq1a42X16T9P_h744eGU2QVVjHutBMEgrO5wd9RpWJw7MNOYKjI
Message-ID: <CAHk-=wgz_YNXErcC7FSr5kKAONTZC=SKLsbu6gFN1hCEE5JsKg@mail.gmail.com>
Subject: Rust build speed-ups - please?
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11356-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49B471708D4
X-Rspamd-Action: no action

So this is not new - in fact I think it goes back to the original Rust
code merge, but it's been grating on me for a while, and it *really*
ended up annoying me this merge window.

IOW, I wish somebody would look  into it. I just don't know if it's a
Rust person or a Kbuild person (or both) that should do so.

So I'm just cc'ing everybody in the hope that somebody will step up.

Anyway, the annoyance is the initial part of the build, which is
pretty much entirely single-threaded, and as a result takes a
relatively long time for many simple builds which just shouldn't take
that long.

I haven't looked into it very much, but I'm pretty sure it's all due
to this in our main Makefile:

  # All the preparing..
  prepare: prepare0
  ifdef CONFIG_RUST
      +$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
      $(Q)$(MAKE) $(build)=rust
  endif

and that just means that the real meat of the kernel build is all
gated on that annoying initial rust infrastructure build.

Here's a test-case that I wish people would look at:

    git clean -dqfx
    make allmodconfig
    time make init/main.o

because for me it takes OVER ONE MINUTE !!! to just build that single
object file due to all the excessive prep stuff.

Or - after doing the above - do something like this (imagine I've done
a big merge, and want to compile-test the *one* file that had
conflicts in it):

    touch rust/kernel/faux.rs
    make init/main.o

and notice how that empty build that doesn't even build 'main.o'
(because it's all up-to-date!) takes 5+ seconds just because the
kernel build insists on updating those entirely irrlevant rust files
that have nothing to do with what I asked it to build?

Yes, yes, those are artificial examples, but they are examples based
on real issues: me wanting to do build checks on certain files, and
then being held up by entirely pointless other builds that shouldn't
be in the way.

Now, we have other annoying prep in there too - I absolutely hate the
HDRINST phase, and it would be lovely if that would be fixed as well -
but the rust part is the one that triggers most easily by small
changes elsewhere (iow - those "test-build during merge conflict
resolution" kind of situations), and really stands out like a sore
thumb in what fro me are normal circumstances.

Can somebody who knows the rust build requirements better please move
all of that into proper build *dependencies*, so that 'make' can just
do it all in parallel with other things - or not do it at all when
they aren't required - that don't actually require the generated rust
headers etc?

Yes, the actual "check that rust is available" part makes sense as a
prepare phase. The rest? Not so much. Why the heck does it build that
'rust/core.o' file when I want to do a test-build of a totally
unrelated file?

          Linus

