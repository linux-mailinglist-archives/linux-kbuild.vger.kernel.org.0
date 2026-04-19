Return-Path: <linux-kbuild+bounces-12839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNybI1Xh5Gn7bQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12839-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:06:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 710CA42447F
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DF173006B58
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 14:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3591137DEBE;
	Sun, 19 Apr 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIk/qiH+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794E237B40E
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607563; cv=none; b=aSxGKlmPo7VcyFAG4n6Dr4IetuUkM4tYpmE+AENA3tnPwXLOA1EsiWac+sTc6jtIDdQyPkO0LYeQ5K9Emu/6EzuLt+8AG5cO0EO3yUIbLmjngbiAejFcxloF9+XN13fj2TNjfFzJihzobBCpYUSNFmz2bm+sWbXrG/gYnwhq9uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607563; c=relaxed/simple;
	bh=6GSGT8vDPiYQI4YGHLluie648X2Cni+IOPr/N/E3cXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGbaM9jNaX+up2/kehR7EjSEnsuDKn8SZ00h9Hs5Wzs8p+MTLETAp2QSm6T0xGOpbbUr/kwqujNnRjLGThFRrbAvC80ibocR/nSLDikXGpveUZBUWqq2Cg1qj56cGvlyKzvKbDz1WbvKvHNtISkk0cbZnEWdZg9/2cs0TBdR2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIk/qiH+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8893bff3so974141b3a.2
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607560; x=1777212360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=CIk/qiH+TtF0CDrdlL6GN5tZFW+JfcNKbAMOrgExu4gssLHfpm7rGJ2VwZ+X+PHCeB
         o+jI+q8/0UXQDbsVLK76hgydBOHvPBv4GyJSUzwTLBM6SPbLEXr1GH3nsMBHcRxgBZSz
         mtVjmqrUtYE2IPCDZw8bn50a7o0tZHI2DIG/ZF99xTU/nyizP2E99EzgeKAGp+LCcqGi
         TibV+NbWOjGeunHYdErng2shKrbwh86K0IuFv1axiErhSMuCY9OAMBMf9c5OCyGE0IiJ
         v9K9BNx7IVx+369r71PiVOmrIzs1dT46Z+j6K0msJVksbD2zmqnoJpypeyIdbZyN0BXI
         LTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607560; x=1777212360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=jfzk3+KCejJLVCzPhwzFH7u0XTUW7Wm0XqkyECn5Uxl0jvo+gJO16prDcwX6SPTKJn
         wC+lsIebdQ5R79PPcjSxR4wxnCwCEbhSIkVm41N9X5Md8D1TO0C1xpPA8yfp+QToUHrF
         ziDiLnoolDkNSFJpd9Pz2px1v+JxqOpaGw2lg80B/cWQ9YIpV8Yp/IicOndpWcKBnRq7
         s+djZKDPV0nwKG1DwcrYRwXSHOHPgKMTxwmw+5XRiRWoaAbPqrP/KNH/q69TEIjsOGbU
         YyBwzimWT8p6TTcDucZiTWAJ8i9AdIbD9P1rd4kolsatTUyKV6TUXTTfFpaHtSz4RA/2
         PG2w==
X-Forwarded-Encrypted: i=1; AFNElJ9/nvGOshZXOaZ7uITx0Z5rggqiG8uEZ3O8amwg/VL9lkz7Tv5zubqFjJKXOywJa8hpaABWCWlNJDWaNSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmAiFHRaGVUWSvTWvZ4C5vDtGS3ALnnyL0QkVeoxdYycEZQMbn
	mzXhGC9CntGhcWeAR6vGnaE9Pl2WU0DxvabweI9BvY/PE6zBbt+fzwlh
X-Gm-Gg: AeBDies7TIFwZ/WsRh7LcYcVIKfPO/w2OO4ih+9dv6HNTILXehsW1WXTgvhDu3sV1h3
	k1ZTKEQ1eoGTyhiQt7Qcbjg23GBLuacTuGSSuLwJiL3+7PNI/qC1TkDKZchW+X1m7SJqcrKlrSX
	yuuKoYogf1rbfFzBodGioU9Nu9HUHyJQEKoNtcEjK2aT9nGSZJVqOiEdB6OviVnPT451ONKWjJ+
	Ye3IT702ac7u19UDjuNZgwM+uvXVu7pWw6GWqKNLcf5X4MjcRgMco2iKHr7YSTTanr5cro480ae
	XnEh5IFllzWLiLPaLhsAp+kaC+tjENefADMUlu70egIY3Zt9xWIHh88CjEPzWJCcnkKaSh03531
	nSOPR9CmkUlsvoxcC6t/CczUIqs3VGelBLisXlbPIzn9q2bxg617UZ8LoxjkW62hZLySoTRJukb
	TAb9NQxrnN/BuUb7IhYOmZOz16Qg==
X-Received: by 2002:a05:6a00:91d6:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-82f9985d570mr6233840b3a.24.1776607559756;
        Sun, 19 Apr 2026 07:05:59 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm9667974b3a.45.2026.04.19.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:05:59 -0700 (PDT)
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
Date: Sun, 19 Apr 2026 23:05:52 +0900
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-12839-lists,linux-kbuild=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 710CA42447F
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


