Return-Path: <linux-kbuild+bounces-14007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TMXEJDczVmol1QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14007-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 15:01:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B4754CCA
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 15:01:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JHxUd+ao;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14007-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14007-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C46093007B30
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 13:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A309C451047;
	Tue, 14 Jul 2026 13:01:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F744D686
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 13:01:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034093; cv=none; b=qTnFfkqNK3wbg1mWtHJlWFlx/kCdKnqgEc0MTI4zhHHA3bSaWSHFVmCxpV7RtTONY1fzC2aT8buiHUwTkK5my9KDSIiTEkqvEDaimoVPJtYJPpwseUppQ1eYM/8ruJR2u8DfSHX9U4Ti6fwSfYv/vTaP95Qmxa54WCR+bgHpIyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034093; c=relaxed/simple;
	bh=WyD1J67XLcG4IvgaToe6usp9r1XMFajI8TfGZjbTKNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGm1mYhUTB0Z92qxe3mGGRD2ZtIOwYAOAaLfFBh3gWmOrItBaMUoNAeHD6zSfTfbNYoLuB9olvM6ibBg8nXufb6iuIly7InKS+XYNqwuNcEuma9KhrxkrxS8GaTn96S2SNtWNwEiGwffJwyEn/Gsuf+EhN5qkigY33LYW0BrfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHxUd+ao; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so6571215e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034090; x=1784638890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IfAtkXqwgooxM2+QCHwHCGB2euY51XhTX8AA+P3KJww=;
        b=JHxUd+ao9KEp9ZqYs/8J+LRgwdZzsYv5FbLPUtGgSP8Ub6mx45fBQ/intdrbn67PZp
         FSaZIEf683hdEa3FWTND8RAtA9RiAgdlXyjzZFletgB9Y2Fg6H77VSWw71LTWfWO7v03
         cZW+RlKJUOiG2KE5mYOr3QCIwiHdgmFtRCs/S6O/WMuha+lJgmn5dw7zcorjs7X44DDr
         aHRjp8R34lhShKm2VLKIaXEIkieawf4rDguY0EHWb0IpRTmI4W6TIPVe8o9sFifVSWVA
         DjXzdZSSQKCTtoXAN0xItonKe65jzSeUzKDWSRsN3swTkwEo8Oj/7VSGa2f4VOdMFEZf
         n9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034090; x=1784638890;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IfAtkXqwgooxM2+QCHwHCGB2euY51XhTX8AA+P3KJww=;
        b=l2PUGI5o57vHcqfcavFAKDj0uueaHJrRf8Tdf7EIBYjdGJrx3WulC/snPSAEeyzUuC
         RpgNIqvIsYtLXM+x7mBZMB9XFTDZWpCjvDj5QVK+qVwKQJwvCpqSJcaBxKRHA19/3V9X
         MibwYT3I70PWLMwVDY/6CeQJEcIuti2TAVok1FgLxhZoLdICENQMA3xbHqq5c91yhCaq
         oL2A7XQm+UilMDj2mBekz+k1YbSCJipVlOlJuz1N86BBStyF6QK7fF3xfcGUop6U5aRs
         PQlERpVtWCuaWKdeTHToncQYHBQnQMATII3pi9wRri/oKvrFyBcT6OkYNlRM9gzdrQBO
         VQIw==
X-Forwarded-Encrypted: i=1; AHgh+RrpHRwCnYnMBXmCS7bDBNwuoskL+ip3qw4MM4Fg5pxNPxz5duJFAnXae+UZybfkmr1Wzi50Vz87f7mdgTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+a58dA+VnGatagopKP8o9GSoMog8QXWvAXawr7ftqrAV6OsDX
	cE0R252aJ+13qLnnK1vK/6GO1A2ag+9WkGsbc587nZgEmBvn7jeveMUu
X-Gm-Gg: AfdE7cmUaaBYEj37vYRlOAWQ3r9QylImmGe5rPkepV0Op4E6t+dBa4Z50tR6s3sbvc8
	tbAi54B8XCNqOoMa3WQ5pJUqnv8zqjE/VT3KqNU1MvmItVB7lTka0c9YG59/NvceS09FNA1sWHi
	hBdiNfDBKlhCXYBUd3rglR04q82Qyws6QBmXW4YVZUCsHYpHnRnU4f8dDdrIr48IXh8pQWjN7T7
	nBa8j0iuXKOkf9ypQYf06FVPyRtfWgv+8VHntvOoG3iAdWQcoj9kM8L9+qm5jMroc7aUvRr1++F
	Xq4P0ONRiOW1NhDIIkerS5TkDuzLJHWx1gVTyt1t56e0WVFlXwKaWt7W/h+zs6749Kg8qq+8C/y
	Rr+viDgQ2lk+PgbKTZ1P0t2BqygOVv2XSDNOuAosYOXBFnOAB0JvGoFX4BrcwRs8TFkkeemgQBX
	r29ytwLRGxeOqNnTc8STxaw7jVAm6M1CfltQ==
X-Received: by 2002:a7b:cc8a:0:b0:492:2fc8:21f2 with SMTP id 5b1f17b1804b1-493f2a969a8mr154494525e9.8.1784034089745;
        Tue, 14 Jul 2026 06:01:29 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f462e0cb2sm8005729f8f.0.2026.07.14.06.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:01:29 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sergei Litvin <litvindev@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	nsc@kernel.org,
	nathan@kernel.org
Subject: [PATCH v4] scripts/tags.sh: Add support for rust source files
Date: Tue, 14 Jul 2026 14:52:59 +0200
Message-ID: <20260714125259.78824-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714122441.78158-1-litvindev@gmail.com>
References: <20260714122441.78158-1-litvindev@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14007-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:litvindev@gmail.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nsc@kernel.org,m:nathan@kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-kbuild@vger.kernel.org:query timed out,daniel.almeida.collabora.com:query timed out,boqun.kernel.org:query timed out];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D68B4754CCA

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
Cc: Boqun Feng <boqun@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Tamir Duberstein <tamird@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Onur Özkan <work@onurozkan.dev>
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Changes since V3:
https://lore.kernel.org/lkml/20260714122441.78158-1-litvindev@gmail.com/

- Fixed list of "Cc:" tags

Changes since V2:
https://lore.kernel.org/lkml/20260714083709.69517-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72k0RbkWk=8hiNzHUmFWr=6OA2DBHAUew4OfZb_Umb=6hA@mail.gmail.com/

- Remove "Cc: stable@vger.kernel.org" tag, because this commit introduces a new
feature.

Changes since V1:
https://lore.kernel.org/lkml/20260705175957.4672-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com/

- Add "Cc: stable@vger.kernel.org" tag
- Add missed "Signed-off-by:" tag
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


