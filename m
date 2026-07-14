Return-Path: <linux-kbuild+bounces-14006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gHjcITcsVmrT0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14006-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 14:31:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE637754939
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 14:31:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=huMDaOTL;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14006-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14006-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8C623196A85
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 12:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D7E448397;
	Tue, 14 Jul 2026 12:25:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9444534A8
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 12:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031943; cv=none; b=G4dgltWPavy43chgZY0vaucJbZSPWiTtPCRE/fMbyNBSXjGjLsXvckF2UZgUkBAuQ2LOi3vIw/aLQzyVl88nWhHTEaZbbWO0y32Nhci4AW+PuaAWaxPZe8ueIS/0JDNuh41KDOc+g7ivXWwmnfCGVl6mxVKdYexQiXmsRowq75E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031943; c=relaxed/simple;
	bh=J6NlgFsAKVrRbc9Bh9K1zEA5jJs7eG1zbZHbBQ6rkqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWwgr3D7dmJfyEtE6n9QoCY/kh9F+2v+6Oc7E8w+CxzZ8JqfVvyxbUVxDf8X6VJzYPyZzqwPJh04bjMnc/JzC1juMLReKO+RMXHdhkiedsJfOK44RnSjM4dqbJ6SC4BO+IJWz8D6VrAWfVlo1jV7jfIvCSaVxZobSq9bJhMqLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huMDaOTL; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47db714766aso533003f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784031929; x=1784636729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ncG6NWUejHTeECNrJBlBEYBi8S2JGts4XbtecPD+Mg=;
        b=huMDaOTL1YTn7uHZUwoZFpnn6KrohmwK+rpKzhrCxoOj2zVCQZJRFQGsLGRE4Zk2rD
         7IBWcW/ul4sie0aFzqYuHJav5kDWYVf/zzfX76exbXPJwUQhshrWPxAMZyYgcJROESWN
         rid1n0DKxw0PLgHb87vewmfEshavGS1etEQCFpoUGwHkQPrqXcPoFeTUITDy7yDuarJW
         ZB0EiIUq/buk8mUamT6tDvOZ+Tbk3wFX0vCZtOhtEFkCRMIq+zMj9JL/GdfBxFi0EQJo
         w50s0OB4tUgk7xaHY1Uzbkim22HgGzR3cUz5z8/p2jpnS1zWz42Ff0I1RfcUYNAC0Vo8
         jUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031929; x=1784636729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ncG6NWUejHTeECNrJBlBEYBi8S2JGts4XbtecPD+Mg=;
        b=rFjYEEyCfjSZB4kvBRvBOw9Cg01Q1fmdN98Np5gtOXJhL0Wd/3O5C/McrdD42KXUVq
         rHWQNUGlsjVBi4z0pUbFzxQzlsj37t4fOnWw0hhh2r2xGMdQRivm4qa3Zle63eZpSo9s
         JJX5NoMHjbUU5fzahtnSUu/d+L2YsUXfsB1ZUxXRT9beBOg8b0+Fz5+GnPLAhHkLrHZO
         pPxk56SCwz/OovgUcR30TT3WPDm8afxSjK+hUWPXSU6QLEAU1++qa5Cs8dEjg2w1uhO2
         WK8erJIOf43CZ4YJsHOJQpHIfkGwEMjfZuWvbpQpQKxoTATJcpmRD9RU4wlUd+2ffWt6
         OkCg==
X-Forwarded-Encrypted: i=1; AHgh+RrMkGvLdMU0pXAgYsFpbPkipjg05NJEXYWxS3OugjALkG/NSxc0EV/f9AcCJ5lbxGTotmoD2PxqH4Ikhb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQ8thWN8CU5KGx+5CdC/FdhkLKFHVjvAXAyrlVgbN5Tu93JLX
	EvnMHT3YUKZQK9l9wOyzLdsU7ZHjWGChaS76kfxXxejFimn/CEkF2fMG
X-Gm-Gg: AfdE7cl5ST1LxNknAKookAslRWEQN/YdYwZAzCL57OLSQhQ2jNXbhso8HcYaUKMgsRf
	g0A6PftIV8L9EtGoMXv5uWgmdm6t1Hi9EPoOUE6gk/6mlOE94a6dFIVDhWNBQ7kLDe/sfAKAKam
	TPibQ2L3SpKTFEEhRjhKcRiQIMgOH9PsCq5cHpYV8tfAKjLFkpYP2yDkH1hxZQfY4HoMjS5PJfc
	6l38QwQRF9nMF6J8w1wxcPHO/EqyE83YP/uJtOEuEq9MyzARHdDp/fsYuUn0wIbPaPDcJx1qAnn
	IUYp8HRLjhIvG3L5crsCv3tNnbeJhsWVGRbFIW0/9l55VDg/cCNehD1pgO1U/8oBEM9kVUO+pbt
	VC3W8e89T5jmSQyGHn+1pkjlwVJotJoLIrUaCMr40qvVarWatbo3lwqUB1RirVpfT/SzuU5twfi
	9o4q2SYw15oeunQEbjDwZB/6LXkeyoG9Gedw==
X-Received: by 2002:a05:6000:2f86:b0:46b:70db:2113 with SMTP id ffacd0b85a97d-47eee0b8778mr21935039f8f.0.1784031928859;
        Tue, 14 Jul 2026 05:25:28 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f4635ac2esm8026897f8f.13.2026.07.14.05.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 05:25:26 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	nsc@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v3] scripts/tags.sh: Add support for rust source files
Date: Tue, 14 Jul 2026 14:24:41 +0200
Message-ID: <20260714122441.78158-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com>
References: <CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nathan@kernel.org,m:nsc@kernel.org,m:litvindev@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-14006-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE637754939

When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

To fix this, modify the functions `find_arch_sources()`,
`find_arch_include_sources()`, `find_include_sources()`, and
`find_other_sources()` so that they can accept an unlimited number of filename
patterns as parameters for the search. Add the `setup_name_pattern()` function
to convert these filename pattern parameters into a list of parameters that can
be passed to the `find` utility via the new `pattern` variable.

Cc: Miguel Ojeda <ojeda@kernel.org>
Cc:	Boqun Feng <boqun@kernel.org>
Cc:	Gary Guo <gary@garyguo.net>
Cc:	Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc:	Benno Lossin <lossin@kernel.org>
Cc:	Andreas Hindborg <a.hindborg@kernel.org>
Cc:	Alice Ryhl <aliceryhl@google.com>
Cc:	Trevor Gross <tmgross@umich.edu>
Cc:	Danilo Krummrich <dakr@kernel.org>
Cc:	Daniel Almeida <daniel.almeida@collabora.com>
Cc:	Tamir Duberstein <tamird@kernel.org>
Cc:	Alexandre Courbot <acourbot@nvidia.com>
Cc:	Onur Özkan <work@onurozkan.dev>
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Changes since V2:
https://lore.kernel.org/lkml/20260714083709.69517-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com/

- Remove "Cc: stable@vger.kernel.org" tag, because this commit introduces a new
feature.
---
 scripts/tags.sh | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index c9dc2763a505..41e38df96984 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -46,13 +46,31 @@ elif [ "${ALLSOURCE_ARCHS}" = "all" ]; then
 	ALLSOURCE_ARCHS=$(find ${tree}arch/ -mindepth 1 -maxdepth 1 -type d -printf '%f ')
 fi
 
+setup_name_pattern()
+{
+	pattern=()
+	for ext; do
+		if [ ${#pattern[@]} -gt 0 ]; then
+			pattern+=("-o" "-name" "$ext")
+		else
+			pattern+=("(" "-name" "$ext")
+		fi
+	done
+	if [ ${#pattern[@]} -gt 0 ]; then
+		pattern+=(")")
+	fi
+}
+
 # find sources in arch/$1
 find_arch_sources()
 {
 	for i in $archincludedir; do
 		local prune="$prune ( -path $i ) -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
+	local src=${tree}arch/$1
+	shift
+	setup_name_pattern "$@"
+	find $src $ignore $prune "${pattern[@]}" -not -type l -print;
 }
 
 # find sources in arch/$1/include
@@ -61,14 +79,17 @@ find_arch_include_sources()
 	local include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
-		find $include $ignore -name "$2" -not -type l -print;
+		shift
+		setup_name_pattern "$@"
+		find $include $ignore "${pattern[@]}" -not -type l -print;
 	fi
 }
 
 # find sources in include/
 find_include_sources()
 {
-	find ${tree}include $ignore -name config -prune -o -name "$1" \
+	setup_name_pattern "$@"
+	find ${tree}include $ignore -name config -prune -o "${pattern[@]}" \
 		-not -type l -print;
 }
 
@@ -76,23 +97,24 @@ find_include_sources()
 # we could benefit from a list of dirs to search in here
 find_other_sources()
 {
+	setup_name_pattern "$@"
 	find ${tree}* $ignore \
 	     \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
-	       -name "$1" -not -type l -print;
+	       "${pattern[@]}" -not -type l -print;
 }
 
 all_sources()
 {
-	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH} '*.[chS]' '*.rs'
 	if [ -n "$archinclude" ]; then
-		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude '*.[chS]' '*.rs'
 	fi
-	find_include_sources '*.[chS]'
+	find_include_sources '*.[chS]' '*.rs'
 	for arch in $ALLSOURCE_ARCHS
 	do
-		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch '*.[chS]' '*.rs'
 	done
-	find_other_sources '*.[chS]'
+	find_other_sources '*.[chS]' '*.rs'
 }
 
 all_compiled_sources()
-- 
2.55.0


