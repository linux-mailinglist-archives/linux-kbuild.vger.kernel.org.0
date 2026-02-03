Return-Path: <linux-kbuild+bounces-10978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO4mBwhBgWl6FAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10978-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 01:27:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D0AD2F64
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 01:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9507C300609A
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 00:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7990313D521;
	Tue,  3 Feb 2026 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4h5okCy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F8E555
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077875; cv=none; b=K55pNKJ3pNnC8m8mm67nUbSgH9r8LJ/AjnpXnLblOCrRDBD6xiEcR+w5spjsDHBQbrk1NIul+YWwG+guIrqRDR7m7DIx7jIk/5WNig1ILFjzBxoN2n/WfXT9WbLasVS0KxO1t8fGxop3Y9XE/oJ4YP8YaJXBbzNGRjdfP0jNrEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077875; c=relaxed/simple;
	bh=ZJVy6cPRC9mVjPwe70OyZwHOLgx0hBKchie2Ey+56o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpSaUJ0LK0MHZeDAjAgn4TOY6xTuxTXQTiMH1v9RRibvILD5OKp7mVE0WCF865qDr9atUdVE9b8L1JIzvFhJ5uvSzwBc37l9pXmgBCcAwOBAEmfsMXCins4zWvFtNjImP2Ma30BuKw6s2D5U8gljCQG9J/+N8yjOqZGVPHSLbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4h5okCy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0c09bb78cso2096645ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Feb 2026 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770077873; x=1770682673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ1ws/HZ3fMtoPm4mMzkQZSOpt+7LENYkmppWHzFdqA=;
        b=X4h5okCysoBz/QiSq5/mM9++K1C1JQlcJxa107X0FYoJkks62N4Vo91K0uWw4MnW3Y
         8e363Uw0SZ5YUckuF/CxOl97e9bS/2c1nm/qXPbEgW/NTN3genVWNb9eDDDXPvu1aLel
         5W9fwyTBlskb0vjfws3Ccjg3eCQUuwmgHlaAOi4n5+soluSYXIzBfXVrWA4Dtl+sCcZU
         6OxN/plGs059h4hIfKWlyXlRT6H/fgkz9qf25aACVQscHoTlAUBnp6tsP00Tm6vzgHqK
         /5+chZvsJkeDiYPwU0K5QMHeXbWpQUtEVft7JOyUsXG3DXvEljLqB+9tBhNIUM77hMpX
         M2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770077873; x=1770682673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZ1ws/HZ3fMtoPm4mMzkQZSOpt+7LENYkmppWHzFdqA=;
        b=DUlXwJlD3jG5irGpr0MtZo3Wp7TgXcQuYUCb5Kg+2uvimEI8JDUiDobW0FHN/gp003
         47P4cXDj7IQbzfG6rl06k7m1GyjF2m+QcIJkrLqY4y/CXg7p3CM6wUO3Hi2mgpgwr/36
         jRqoMVqA6BQGloQb9ceNjDolQCK7e2LfiDosI93/XFFHhR7XzKkZj4khX6KQIDb4Jw1R
         rJ//JjFRr4tMLny18INfjtTjYdMnu3jlA7EcqZYNatgVSRuta9j8e+wbfF07rQ96aQAX
         nm7S91avCChC/L9D/2FZfxKNWLgFU7D6svy0HNovW1pADJDthRKwcQ/9vRLy+h4Y6sQB
         evYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMPu8TEqeLLvOI4WX39/OIdLfyRcOHXjR+RuAZQsC8wC71Gf0sDaDmWbtYbSyaI6MlmoyFBVIsfnSZVQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32QmM1/IqLJqNgR2FKJ/+H8Bjd6lqN/HCRAOpvoedWgZYa7iu
	EmM1tH5so6PQykTrtjdU1W7HPuIV+54tFxQPZ51HDa+Vkw4g59rCwuIR
X-Gm-Gg: AZuq6aJU/5J+JZoXvdoLg+ETRxPeZsH1seVpV+X6zX9MVNWIoRUSTCInSq3d50+qgcL
	MciAmEBJNsn0as/ogOzCCCT5fKzYqYhBEK+dvYY5yvgsnRsaabp4TyaMiMzG3N969cKSAeagKhh
	7VuLY41KBATgOfylTnTifRs8xWFd4c/Hk1FN6tmoepRwMijTcTo5U437G7SQbPMzlGg5DhMiQrI
	zRgsHEksDgnT5MIGqGEijIOw2WvbDxMCyZNCCRK702LD1+txYLY4azaiQYN0BhlzMPVEJ+zL/nw
	D15OQxQKP+stuoKkUEeht8ExgNopUmD7C4Qyu+nQ5QnDrgQ5Wmtxh6NsSlZdNKbb/USQCdh54N4
	8grN+RzY70hOpDlNPd1k7g0zocpf8aWydQFCX9um1o5QRQRRAi0ihykz6SMIKhp7eqQ8UPypeLB
	Cq3Js=
X-Received: by 2002:a17:903:2ecd:b0:2a7:b412:6cc8 with SMTP id d9443c01a7336-2a92458de40mr8592055ad.1.1770077873450;
        Mon, 02 Feb 2026 16:17:53 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4110sm149973765ad.84.2026.02.02.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 16:17:53 -0800 (PST)
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
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	HeeSu Kim <mlksvender@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] rust: Makefile: bound rustdoc workaround to affected versions
Date: Tue,  3 Feb 2026 18:17:31 +0900
Message-ID: <20260203091731.2731080-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
References: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	DATE_IN_FUTURE(4.00)[8];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-10978-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,umich.edu,gmail.com];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mlksvender@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 42D0AD2F64
X-Rspamd-Action: no action

The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
handle a rustdoc bug where target modifiers were not properly saved [1].

This bug was fixed in Rust 1.90.0 [2]. Restrict the workaround to only
apply for Rust 1.88.x and 1.89.x versions that are affected by the
bug, preserving ABI compatibility checks on newer compiler versions.

Link: https://github.com/rust-lang/rust/issues/144521 [1]
Link: https://github.com/rust-lang/rust/pull/144523 [2]
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
Changes in v3:
- Remove Fixes: tag (this is a feature, not a fix)
- Use full URLs with Link: tags instead of GitHub-style references
- Add Link: to lore.kernel.org for Suggested-by attribution
- Add Cc: stable for potential backporting to 6.18.y

Changes in v2:
- Change approach: bound to affected Rust versions instead of ARM64-only
  (the flag is simply ignored on non-ARM64 architectures)

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83454..55e2dc865207 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -136,7 +136,8 @@ pin_init-flags := \

 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
+# The bug was fixed in Rust 1.90.0, so only apply for 1.88.x and 1.89.x.
+rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),$(if $(call test-lt,$(CONFIG_RUSTC_VERSION),109000),-Cunsafe-allow-abi-mismatch=fixed-x18))

 # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
 doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
--
2.52.0


