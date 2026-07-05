Return-Path: <linux-kbuild+bounces-13937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jl5mEambSmooFAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13937-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Jul 2026 20:00:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C611270AC20
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Jul 2026 20:00:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=psAaykJR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13937-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13937-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47E0E300CDAA
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2026 18:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C893090D7;
	Sun,  5 Jul 2026 18:00:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E947430677E
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Jul 2026 18:00:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274406; cv=none; b=ijpaDlrBvpEXqz2JgSoN7WMjaKHtVQRzq2yvFYf9wjXaQFCouddXOXfQeNqmEMvxcM6fnhZTZDcoMdbFambIW0DqMexkSS2HTgCtql0rbo77P5DBB3jtMtdcIx1COP9rdGdN9shtpZ56zMsQb+mMH45kiEsTZctqGq3h3NiFDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274406; c=relaxed/simple;
	bh=pcUt4ECBHp8fwLieJAcIrWj20xaV1v0BfHd+NcNrWjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnxHHBWjO+oHBAPVLj6yL6J2yv9bokXD/ablCFyR2x1dL4fjlx3N7v3m3fSzeey8tgORGmaPq7sgGZOBRR3/jO9guWo0drT1YXCrQ61dP+zmBlTvNsbCHePFXbTrLooQTZkWdgxNDOZrxvsB1vLSbFepIvgscMzd7xEgBc8VHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psAaykJR; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b966dd74so7153195e9.3
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jul 2026 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783274401; x=1783879201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejKKZA+gzkTcRsPeUIx3jem6/jVbmODgcUaRcC0r+t8=;
        b=psAaykJRcXCQ9sSZbFL7GZiQuk4uW5zOK96wRH4ZnKimyJXT/ptXCJ2QLhYzoEpsx9
         Ih2caGJrHIZrz2vgcwbbZwJMEpS8qa0wJ5gRwfrcmbjJn9jgZZ8AF/uLjHSeeU1foxlZ
         TxCNTP8AHO83dmxGrJvgNShz1G/UClNvgbjvuL6FCti4SWKnrE5oJjytROPMFfB22lh0
         wP5CoTBUNXn+yeCD3IKTsDXG6pfOVmwVvDV0etjMqJwxln7AreYz64QWP7SCoGa6f14a
         xq7+HxYT6whcDVn6crxYUQmMXwlHGPuvDMdqfSfq5z4zpsrYskKGSjs7dU+B/k+Q+0n4
         hbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783274401; x=1783879201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejKKZA+gzkTcRsPeUIx3jem6/jVbmODgcUaRcC0r+t8=;
        b=ZmjmKB+ULPT6DpDh5VlZjejkjjQZIlreUIqblAbO2Vxo3buI78AQk/PIlZQj8qfC5H
         DDGbUqTneHSy+glmMFQYnnE7TPvYAip6i658eVYmpiHcRNhSyDQ+43iIS6RxJJxFrxqh
         jeeQIeOAN2LV06KTrEgt6TVwUJDmCH4Y+80zIDxav2mHNV7xJv4Ub9F7zyLqxXBMB+UK
         UKCMs9kJb9TOVbOz5ICt/LiK/P7SnH9WNQlaY9RSPcmRJ+eMPiQZy59bOijQ9wpwRfTo
         9CwjOT6SSWrs/IM8fAGRByeNFb+DtI2hSi3VsgVISO+gDlQq62MhSFTpmem/rajHTjEI
         ccPA==
X-Forwarded-Encrypted: i=1; AHgh+RqmFRr9Fi8ojmnq9iz92FoNtUew3hTehlebdMrvCdCj19Nx0WidIo+IUk7v+v7ZFuMk63Ye5HbVqKrrb0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBgcAofpEa2RQ4s7WISzRbxMciuPte2d4vmnek9pnkm41Mpa3F
	0NBkmWKxrQb7hAb1DCNGJyaOhgog6iRKLH8+KNEVFfle3NJB+zfEm+GG
X-Gm-Gg: AfdE7cmKHsHFXUaJ5tDImS7zRmbBpLee6l239aYsf/3zukC6QEBn7yUw8vNAtFXfQs1
	uHER8sa45SkNp2mr7eAuUaI7aOjJF2/xJ3n5qhagxEeUABVy1vALDbmd5kH5MGg9dM4FvqYH9hS
	+ESaHjpt6DoSAKZPdP7MApSj4MsOwNTveRnvRtQ2M8UuxT4bUD7YEOoreJpmnqr2xTK89P7ETWg
	7cH0AHn+dpZUoM0ROotS2TUgpd2xf4umDTzHdP/dJFRP/CF3As9ztwrjCLLLHbG5ZA0obStn9PR
	lNY978Di4I4P2jEQnHYkqjak5qhtnGMLXvtRqJf/Etfu7rjeXz4MPhP+HEIDPBx3Sz5klHHOJcg
	rbp8wlbBp/ejS5TrDM5ZsBuq/idfH4ab7cEe1uKpPFcIhuJdO+rNPABdvyjSSkQhsvMvjNvyatC
	hSJaa+oSla33dGx8AE4CG71gWXEHpT8JDk5w==
X-Received: by 2002:a05:600c:358b:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493d11f13d7mr99093575e9.18.1783274400696;
        Sun, 05 Jul 2026 11:00:00 -0700 (PDT)
Received: from localhost (a89-182-201-232.net-htp.de. [89.182.201.232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47ad69519c2sm17994734f8f.37.2026.07.05.10.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 11:00:00 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: nsc@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH] scripts/tags.sh: Add support for rust source files
Date: Sun,  5 Jul 2026 19:59:57 +0200
Message-ID: <20260705175957.4672-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
References: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13937-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:nathan@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,m:litvindev@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C611270AC20

PROBLEM

When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

SOLUTION

Modify the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` so that they can accept an
unlimited number of filename patterns as parameters for the search. Add the
`setup_name_pattern()` function to convert these filename pattern parameters
into a list of parameters that can be passed to the `find` utility via the new
`pattern` variable.

This causes `make cscope` command to generate a `cscope.files` file that
contains *.rs files along with *.h, *.c, *.S

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
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
2.54.0


