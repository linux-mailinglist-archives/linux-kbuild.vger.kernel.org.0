Return-Path: <linux-kbuild+bounces-13472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p0GoE5LKHmqfVAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13472-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 14:20:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA362DF1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 14:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ozv7PPwJ;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13472-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13472-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 200D6302DC44
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 12:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6FD3E9C37;
	Tue,  2 Jun 2026 12:15:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A63E0C46
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 12:15:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402528; cv=none; b=HXh+lLX5PGo3Mpav1Fu0MuAWfOUujA4cY7kF7U3CFLtX/0u7uEu8v9RbjfQAGqAVKrBnHv71x+BQEzcv5C22XWGd+Y2kbL4rtDkvf5Ykv4rAUQaHAkk5WpGgtzuoc/BcqMScJnpGSqAFhZ0j6PiVaWcC+qkLCqt/LUph3y1yDYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402528; c=relaxed/simple;
	bh=8jFenrVpY6mPEQQtImkt6UJT4aM+INO9AtlA9KVwTDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLCc5LLtzlPeB21X9NIJi0Ovo+rXTw4BeFJt81Y2zTnAN/IsepXFO3NRP+cW3+hP8vYfMbEWOoJKiWx6467eF8qDcFhH64LS4YB2dJdB/DNoZdIsn6OCs1zQxyUEoLW+538iTW9vK069fIg5BzXgbWGOvJkHckJ1Yb5CgbWVtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ozv7PPwJ; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1588576f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780402525; x=1781007325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39tomWq/D8VlQLXIgboVyRs7DGzptFPLmBA1BoR+QjQ=;
        b=Ozv7PPwJ9FYIacmMMOcbS84R4q9K8OnzDn9+g3QaNdDUdWjwLGXyChPwRIoUAES3Hy
         V5eIRwHMZnLPkSNB6hyYgMsgjlUZ+sT6toTN8dTMEnl6oNQS3oS8XBCN9vBUV7Z1Q5bT
         vSBTIVJ5434e+n8U/k9Kd6ETmGtDxhgvwdXdw1XtcqvNKjT7ibUioGzPQFwBG7JGjOXa
         rdmc99tY9eTaTFwUHB9CH5guXccEnoQA+5yE99wHMpNIvUeQ7Xyqvi7cDm0o9XoVjkEc
         VT7I1dR0mKXksROclQerxrH17iKlzw+nRWIGqQhFMNWNWQRnkVJnVs+5n9PfeX4Y04dy
         qFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402525; x=1781007325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39tomWq/D8VlQLXIgboVyRs7DGzptFPLmBA1BoR+QjQ=;
        b=H6DFMbxl1Fl1CPsqBzxTqqOOJnPFKhlVWr8KghxXjJ1BQ+11H5VZ2tlSs6U2M9Drn5
         UmvN+5KiRgyA1R3vC5iI6VZ7HzTIZ6sIaKToAjN6sy8qMMFU4e6jtMSp9hhbjHShyP9D
         99LKoG/98mCw1WuvsSKjDSTWsMG57og+ICZZghZ6bmSIZsgm4zG0i9Biz1Ze+s0WqGOC
         VJBnTd1oQ8QLDhD6he19flRe5twb/ZUtKMHYKOxmpR5U+h73pwJPjVQiO5nfUtHo2Ezp
         ZRhw5xFo3ZOrSDch2dJrzXdmhQ/htiOmMPc4dN1QD3Kc4Cn5t34YdU/En5pKf/3DK+UP
         T/kA==
X-Forwarded-Encrypted: i=1; AFNElJ8gmxaPlhj/oxedACZLwONYetCmOLxJGLA5+G2+LCiS2kfiP80AvASYH8I7myWyg9B+0UToJdWsxrqBprQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqQs5SKFNEOzbQOvN/QeK88l9vrmP5sHk7Te7+0yaDFRc6L7P8
	0k8AmVDEey3u0c1SDMieHGP9zyaPcNChwPWLNSKptb14i3Bi58jS3tKj
X-Gm-Gg: Acq92OGaMFjVOX6ZEU783F3zDhapIpJ7+cAZPQtLlh6eOOWqtL9AohuFtOxoSrfa1dU
	0XXm0IP8cD8gjsjO1ztcFtWVPkDMjAbjstXj0kMtwIM36XVHmy+b6C0xSXyPF0yW3dsAT2Hjyae
	4yY4dLSqugkT/i11k0SlHk66jPMu9NOZSfZwknGgJViPhaB7v4Ub49orkEkhf1vtYB+LMe8gLas
	3nYPmphFNr/kih4sQ+CjRFPNYQy30h9kGfP7H6lSibOQzyAsu1Vrwg90W+pyUEhPcV/ePjUNyLg
	drySU7OtaqO+nEmvTB0IoQcuaH7AK+gcym0NOAzf/Uq314k798AJzoMB8t32bnPd6c+eJoSZ8hU
	ZJmhRLtsf+w6CTM/4cIDImv6q5sLIYY1QmZZ+V55btajwql3m2m07UtGORYRg3ujAcJt8YhzihC
	JOWVczJCXbP8dN7QNkjVWYL+GEmcC3uwgiPp06SVxNdywW1b6utQVz+eU=
X-Received: by 2002:adf:f902:0:b0:43f:dc54:9493 with SMTP id ffacd0b85a97d-45ef6b5b602mr21478259f8f.21.1780402524564;
        Tue, 02 Jun 2026 05:15:24 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef354b5bdsm31879617f8f.21.2026.06.02.05.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:15:24 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v4] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope" command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Date: Tue,  2 Jun 2026 14:15:21 +0200
Message-ID: <20260602121521.11650-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601211850.3378-1-litvindev@gmail.com>
References: <20260601211850.3378-1-litvindev@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13472-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[litvindev@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ojeda@kernel.org,m:litvindev@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08CA362DF1C

PROBLEM

(1) When executing the command `make COMPILED_SOURCE=1 cscope`, the
`cscope.files` file generated by it includes filenames with the
extensions *.rlib, *.rmeta, and *.so (taken from *.cmd files, which, in turn,
are generated from *.d dependency files by the `fixdep` utility).

(2) When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

SOLUTION

(1) Modify the regular expression in the `all_compiled_sources()` function so
that only files with the extensions *.h, *.c, *.S, and *.rs are accepted.

This causes `make COMPILED_SOURCE=1 cscope` command to generate the
`cscope.files` file that contains only files with the extensions *.h, *.c, *.S,
and *.rs.

(2) Modify the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` so that they can accept an
unlimited number of filename patterns as parameters for the search. Add the
`setup_name_pattern()` function to convert these filename pattern parameters
into a list of parameters that can be passed to the `find` utility via the new
`pattern` variable.

This causes `make cscope` command to generate a `cscope.files` file that
contains *.rs files along with *.h, *.c, *.S

Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

Changes since V3:
https://lore.kernel.org/lkml/20260601211850.3378-1-litvindev@gmail.com/

In V3, the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` were modified so that they
no longer accept the filename pattern as the last argument, but instead retrieve
it from the new variable `pattern`. However, at the time, I had overlooked the
case where the `find_other_sources` function was called with the `Kconfig*`
parameter. And after Sashiko pointed this out to me, I decided to rewrite it in
the current version.

Changes since V2:
https://lore.kernel.org/lkml/20260530085821.19689-1-litvindev@gmail.com/

- The functions find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` have been modified rather
than having their calls duplicated to avoid redundant directory
traversals (suggested by Sashiko).

– The regular expression in the `all_compiled_sources()` function was improved
by adding a lookahead anchor (?=\s) to the first branch (also suggested by Sashiko).

Changes between the V1 and V2:
https://lore.kernel.org/lkml/20260530085821.19689-1-litvindev@gmail.com/
https://lore.kernel.org/lkml/20260530070631.14955-1-litvindev@gmail.com/

- In Version V1, the `-name` parameters to the `find` calls in the functions
`find_arch_sources()`, `find_arch_include_sources()`, `find_include_sources()`,
and `find_other_sources()` were replaced by `-regextype posix-extended
-regex`. However, as noted by Sashiko, the `-regextype` option is a GNU-specific
extension; therefore, in V2, duplicate function calls were introduced instead.

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
---
 scripts/tags.sh | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..41e38df96984 100755
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
@@ -100,7 +122,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.54.0


