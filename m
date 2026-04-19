Return-Path: <linux-kbuild+bounces-12842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJV7Mp/h5Gn7bQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12842-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:07:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 552244244C9
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B123E3010EDD
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 14:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D303E37C10F;
	Sun, 19 Apr 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+wifKV2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD335C185
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607579; cv=none; b=BY8BRBTMJIx7IjWAowNQuLfe4rFI3jNjhzubsUBm6mZRP5bz9Cy4vVozCAK5z32sNLycQG01Mn66R+wlLkqOewW3TGLOphhUecYZwVFQqoKRpfxZcEQHYwIyyUKAJQbNMvZidwWEMLy4gkml3Y1odDHMHyNhrEgpsqEn01eeRAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607579; c=relaxed/simple;
	bh=6GSGT8vDPiYQI4YGHLluie648X2Cni+IOPr/N/E3cXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lz59tWegtnMxdE3iA+Axq+XFnjzRJZq8sB+NTHSZZHv3T3p/6ha+d27Lh4Mh8TodVWRjAFyREenaypLqrAQXzOXynX+lwp3al/VnWGTWMfPH9rjHcAKtrTGYJ7vcWJGeyaNJGYKimhu9CHd0i+iZm8DFexh+yK5QpF2lcXZPbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+wifKV2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-356337f058aso1351238a91.2
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607578; x=1777212378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=S+wifKV2ocGrbF//7oJUX8XtbvZxx+YH/TjDfTDx3jpnwTHln41BITOaycAUKXCqgJ
         OMwAN1vN34i2CttY5WoWULqeuIQy4A9JtCaK0gFuW/O6awKA9Cghwv9v5DUAPKtpkLll
         VN3RS1B5e11O4T/D+oAxh5oFgETCgd3NKB42+J+1vvcjSWnjeXWtkjHpXkjoEwQztbxn
         blgoVh9296avlWaFst+pCaC/p7wrqT33VETAopPQGWaQO0v0HNsz50y5v+30Y9jXohqg
         iKDbhwHOpYkKODT92Vl6e1kisN1NW7Vt+ZMsDGJDRKcmTc/kSlpVyREVVkYfD2DcFTZs
         kcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607578; x=1777212378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=FiYaOzMdpBtcsrddqYmO1rKIqCvHsv6Z5J++lA5oTEeaQO9091T8LHmEtS/sPboe45
         ZAot5I1wDHJBtPEz866+xFP3lLcRg8ZBbGRmByNtH0VKMVTKx0MMo7Ep3RF+VeXAKqWO
         l9O2P6FnnYcs8cy/TANx3maMPVsHRCphNHzKhSAlraimJp7yTTBWD5NDK3yKDw8XSDo4
         S0Lezkd+G9ayPlNl1M3Vpb9J57Jjgp/8Wbxx5IIEnb5Svi2GVPQ1UqHWeRIwfcIi/Xg8
         aWf2JcrWBYfi/5l6+J/HDQHMW29VtFZ29Yufi6LEWNQjxON02wSlcdZSx416xrMC1Rle
         wp/g==
X-Forwarded-Encrypted: i=1; AFNElJ9jiUXIroxSslhe53o0nklT51cBMuNcU4Z6wTYbSUO3nkaGiRozqFy5EzloLTxyYteeTcsIkwdwNX+2ImQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x7rTj4H1WXPk1AIPVSaOQmD7biMjS15E+LobwSAAJHuhpkr8
	/xLeULldtJJ0e9kFvlGl/SqZM6NbLNLE0yE6Jl9sQdSnpWcJSf7Q8L6i
X-Gm-Gg: AeBDies6nzCDTnWHYzMkoO5fFHXPLI0+l5lHU0WiptkCwblKhIJ145RXWuGx0Dhs09k
	UCbunSxAzw0dvndjXyfScAkTZ+oDwIQ3hH48vjMbJJpcwDRzHflEPrCnYjmsXE1I8lchzNpmRi/
	pjYsUnFCPvzn1F2nE+09I6uODaTVy0ryGq/JCeyBFsCblsZqIcc3r0gqi7O+K4/2BGHg2U4zYAP
	gLexzEb0k5UlsBNtFMaG3j97tA9+LhYuwPOLtHATy44dYhbEmnznAVFh9L2xATwgXsCzFvUAfOX
	3ZFlb7w0PuRVL/0oAddwgHO9D7BHeWaGTcgMkdSxYTrVgNOIsPzoPMvpOHeZ9vHZGpEonXSHlb/
	b+mS0q5McjekuPAZr5aUGxyvpfHlTALQ1pK/uocxJlooQn48UpSnl3mmfwSqmFhDt1rZE2Dd3Za
	zjbP8uCucm0LaGRdcWOngwwtnBClw2HruUkMrw
X-Received: by 2002:a17:90b:5112:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-361403f4e8cmr9215960a91.9.1776607577877;
        Sun, 19 Apr 2026 07:06:17 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm7718121a91.7.2026.04.19.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:17 -0700 (PDT)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v6 0/2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Sun, 19 Apr 2026 23:06:11 +0900
Message-ID: <cover.1776607331.git.mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
References: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-12842-lists,linux-kbuild=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mlksvender@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 552244244C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series bounds the `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround
in `rust/Makefile` to the compiler versions that are actually affected by
the rustdoc (#144521, fixed in 1.90.0) and doctests (#146465, fixed in
1.92.0) target-modifier bugs, so that ABI compatibility checks run again
on newer toolchains.

Changes since v5 [1] [2]:
 - Patch 1/2 is v5 1/2 renamed from `rustc-max-version` to
   `rustc-lt-version` per Miguel's plan to rename on apply [3] and to
   avoid the `99` form. Nathan's [4] and Nicolas' [5] Acked-bys from
   v5 1/2 are carried over as Miguel indicated they would be preserved
   through the rename.
 - Patch 2/2 reworks v5 2/2 to fix the doctests case that Miguel
   pointed out [6]: the v5 form reused `$(rustdoc_modifiers_workaround)`
   as a prefix, so on rustc >= 1.91 the doctests variable expanded to
   a stray `,sanitizer`. Use Miguel's suggested explicit
   `ifeq`/`else ifeq` layout with `rustc-min-version` +
   `rustc-lt-version` combined inline, so each affected range is
   visible on its own line.

The `rustc-version-range` macro Miguel mentioned as an "improvement on
top" [3] is intentionally left out of this series; I will send it as a
separate follow-up patch once this lands, as Miguel suggested.

Tested by building `make rustdoc` and `make rusttest` on rustc 1.93.0:
both succeed with the workaround disabled (empty expansion), confirming
the bugs really are fixed in 1.92+ and no regressions are introduced.
Macro expansion was also spot-checked across simulated rustc versions
1.87 through 1.93 to verify each range matches the expected flag value.

[1] https://lore.kernel.org/rust-for-linux/20260205131522.2942928-1-mlksvender@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20260205131815.2943152-2-mlksvender@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com/
[4] https://lore.kernel.org/rust-for-linux/20260203221224.GA2703490@ax162/
[5] https://lore.kernel.org/rust-for-linux/aYS9bRugxr1rUvA3@levanger/
[6] https://lore.kernel.org/rust-for-linux/CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com/

HeeSu Kim (2):
  kbuild: add rustc-lt-version macro
  rust: Makefile: bound rustdoc workaround to affected versions

 rust/Makefile             | 18 ++++++++++++------
 scripts/Makefile.compiler |  4 ++++
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.52.0


