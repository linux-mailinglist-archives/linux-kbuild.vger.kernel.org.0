Return-Path: <linux-kbuild+bounces-14003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id He7ZN7X2VWoYxAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-14003-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 10:43:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F3752886
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 10:43:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RoHG1Zjl;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-14003-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-14003-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F0273009F17
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2026 08:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EC227587D;
	Tue, 14 Jul 2026 08:37:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E885433E60
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 08:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018250; cv=none; b=eyoMSGO3pzybB5U0+u/KPfMKHm4z6eGZJz+/NgVp6NfGmm1OEf2JV9Az4uKPRkJI86ZGfJXa4qcSJub3xHTCfwlV4vhpqyNgpGOXRgbCTFX0vFzaL3svW8FaitizSbRb0iPLepMgwRyeXZ62Dcg4lHBIj8gP4H1zkxIqG+Gtj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018250; c=relaxed/simple;
	bh=jyNi2uQN+yA/KxZs/JeOh8FJ+fAidxRw+r2ty9saz0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alRJWleQFP7ms3nXGOmoeZhN3Hm6ogegaQWhDYR3pNgCfhgpw17g/JAInxqNp1ghifiKn3ZLLLQECy8oVy3VUPhG7aW/9Wd77qvzMYjvrr3VrIpQunqPYo6kFtz1ovIlfs6uXcclhPBpneW0pnzzVA1a56IJk4N3sKYKmE5xQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoHG1Zjl; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de008b020so374014f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2026 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018236; x=1784623036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2Wd2Xk4XZ8QtjBdQAzkHYSxRYvpP0OLkJpmP7Ac0SQ=;
        b=RoHG1ZjlN9LgqdgchRqf/YaTilkFn0aSTzPr5wN/U5HfBN2utje0GaqlVq54eCOhJv
         QtrOgbOUE1xWkc6eNiGptCUfaj84r7C6ABNGYomMT63j7pb8AIX68WhY9+U5wSyDFIGb
         WAEPAYpgpXfmFNtua87OM5m8A3J5hgMkCVb3E/KrDGyZFwF+Ab/QLq1iH9kaW9DvOuxu
         cJhUwP56x44S78K/9JCE/XH+FMTrX3+Pe1s87HQxc3gnDzHNEZxNmrPQuZ+P3bwCOkaU
         XRDXhANlAj4kUjSaIcGRS1i+87/kms91l/YpENjhU5faNS4MKtjjfE1l3TQseMVco7BR
         gi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018236; x=1784623036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2Wd2Xk4XZ8QtjBdQAzkHYSxRYvpP0OLkJpmP7Ac0SQ=;
        b=XUxgGC2hCJ8V/UwgFWntyeGfjp3uAuBGV0wls+VhX0hmQorXtSsVMiUJxwCoV3F1Ts
         7Kt0FLBJcw2MyxWAha8wVlNyB28ijap+fvyxIvImakLwcIj+LFZktFYBDbRNMrz2zjMO
         U8t9kH4sBnkxG7YYn4fWxUm5jYWt4y9KCdc34xe+wy+B+NtIdiKYzLDvnQiFKyCKjFG3
         4IbsYkxU1T0hwzJbJLDEoTOx4lApujv7BIl+mi2NQnzx0iNkj62+g+8Xd78msCEM5oXx
         PWh78sMmK2qvcvq+1wmCfON4+5puleCCJR7Vk7WxKXPsKPNHriLiR5TNisAfc3SQSwq1
         DtGA==
X-Forwarded-Encrypted: i=1; AHgh+RqxafMTWSgDPaJNgEqNM7GgLFLad/2mY65LqlPwoAkE4sQ8NuvUXTamH2kaMuB+UPFtJodlIyb66CynY8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFbDCSULDCZ3Vep/yMAbTHT/M0SvUzm385cRHzeTGSSpxhCUS
	8IqlE+VnGLh9ptnyFxwAdL5LnvQhANAM7b3lGmtZH+FE6/i/uENFCiAM
X-Gm-Gg: AfdE7cmYY4MHHob5wLJNlv+aL3y6qbxKxZ7K8IK3GQ54xMFoe2RUMUBdCE5lEgwQGZn
	h9c3ukSNNCebZnPGeMDHpGDJqEYZCyQ3DAq0cyx3luzj9JGr8lwLtdYsCZowfKqjn8tauLc9NDb
	OCP5AQQQSPROKzF5H3saGLcRWVdD7EMMeozAQv+e6k8J49Q+nA2pHP4EUkdVFfl5EbGCBQO8P7n
	kNPXlvoT5GIvZwC4UYA30PH6T4JIeopJDQBdulsz6lnxrPH0TVPCja/SW0gdbCYQPuPZ6rt3HMi
	j8vKnzLk1AwuFNB/LOUAFx0Rftry7T16kpthxfN4ZBagyrzlhmg2kGcMWVBXKT1l0vlYET7J9Wa
	AvGp1W664WlPHw3KFX3xcyDlyuILOZTRCvwiE+7ip09Qhu/VYWS5/+c9H3d11XatwIq5ZPJI6iS
	UqYh8RlE6GhGa6GFLb8IMldJ3llWGdoxAqRcxlagnvtsj9
X-Received: by 2002:adf:e19a:0:b0:47e:96f2:52ab with SMTP id ffacd0b85a97d-47f2dc85da3mr15640517f8f.7.1784018235606;
        Tue, 14 Jul 2026 01:37:15 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c7c96sm6238308f8f.33.2026.07.14.01.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:37:15 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: ojeda@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sergei Litvin <litvindev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] scripts/tags.sh: Add support for rust source files
Date: Tue, 14 Jul 2026 10:37:09 +0200
Message-ID: <20260714083709.69517-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14003-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:litvindev@gmail.com,m:stable@vger.kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B0F3752886

When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

To fix this, modify the functions `find_arch_sources()`,
`find_arch_include_sources()`, `find_include_sources()`, and
`find_other_sources()` so that they can accept an unlimited number of filename
patterns as parameters for the search. Add the `setup_name_pattern()` function
to convert these filename pattern parameters into a list of parameters that can
be passed to the `find` utility via the new `pattern` variable.

Cc: ojeda@kernel.org
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

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


