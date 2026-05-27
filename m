Return-Path: <linux-kbuild+bounces-13361-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMRiAcgXF2px3wcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13361-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:11:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE95E784F
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EB3B30336D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382EF3E92A7;
	Wed, 27 May 2026 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zgnp+18j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034083DE44D;
	Wed, 27 May 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898309; cv=none; b=DBnax0Nv5NR7XrADMP0vf822XEv0AKJagghOEDjnDnx027AgyAhzAoYqDLHWkoNUjzarQnaR02vIagmJgWk3oCf9iVMAtG13cmwvMJ9na4jGov1ZrzlKRbffGjceZI6T0VJXy11HIFz3x7bVy7LkVNTLXuLo37qX92Nehk8f1Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898309; c=relaxed/simple;
	bh=sdruol7Fs31BeuflQvxXxSyw8QHhUnwIx1LV0pXMp+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ifnoOv14/Ao1TgZjrWVYPqUEGh43PJBqEdiz4uSZAEBmCsdkVx90IihEEYKZ6Nt6BZSHKbl1WSoU5CFmvF8C/qXb227hMTcBoEgjoKq6yzybclxbehzO0hKbJRjBHR5TfH9EJhNwkePdkfcn2Q7wWMpGO7RKMXvtxZm6ymB/HUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zgnp+18j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0441F00A3D;
	Wed, 27 May 2026 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779898307;
	bh=AR6lI/Goj8T5ut7ZS1IbeQktR4TdWge2vQqCWgAJvuE=;
	h=Date:From:To:Cc:Subject;
	b=Zgnp+18jM0sbLlMAS30+7jHyvbrSSFJa8rYVF9cM3y//lyXm0r4hQgt5GPr7TA2Cz
	 PcVVlzt4Ao+y32lt88twnoml4IGfUasL5CAlQf2MZF0jHTVdYI8oMuZht8KvL0k6Tk
	 eADERnLDx0+QwJUytADcD1HVGRfeI7in/BxHPwhjJxtaoTKvFB8Prmg1+WXhJBzP4x
	 MTtSWPZMF8x7DUBNKTDztPiKZ3HV9NL7/caKFeklLNSwIjy5XSmZFMViqk8qJxQ81w
	 kFnm9mDMRYpb7YwSVXUP0egSuNjLn5n0JVjxMLJgoAtgU4Zlt0e6aH41YudPKp/j4e
	 AZvdUC8wa5VZw==
Date: Wed, 27 May 2026 12:11:44 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux trace kernel
 <linux-trace-kernel@vger.kernel.org>, linux-kbuild
 <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Masatake YAMATO <yamato@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 Marek <mmarek@suse.cz>, Yang Bai <hamo.by@gmail.com>, Stephen Boyd
 <sboyd@codeaurora.org>
Subject: [PATCH v2] scripts: Have make TAGS not include structure members
Message-ID: <20260527121144.08a1f676@fedora>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[goodmis.org:server fail,sto.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-13361-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,infradead.org,linux-m68k.org,suse.cz,gmail.com,codeaurora.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 99AE95E784F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Steven Rostedt <rostedt@goodmis.org>

It is really annoying when I use emacs TAGS to search for something
like "dev_name" and have to go through 12 iterations before I find the
function "dev_name". I really do not care about structures that include
"dev_name" as one of its fields, and I'm sure pretty much all other
developers do not care either.

There's a "remove_structs" variable used by the scripts/tags.sh, which
I'm guessing is suppose to remove these structures from the TAGS file,
but it must do a poor job at it, as I'm always hitting structures when
I want the actual declaration.

Luckily, the etags program comes with an option "--no-members", which does
exactly what I want, and I'm sure all other kernel developers want too.

Create a new "no_members" variable and assign it to "--no-members" for the
"TAGS" case and pass that to the etags program to remove structures.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
Changes since v1: https://lore.kernel.org/all/20131115093645.6dc03918@gandalf.local.home/

- Use a no_members variable instead of hard coding the --no-members into
  the etags call, as that can break some "tags" cases. (Michal Marek)

- Rebase to the current decade. Yes, v1 is from 2013. I've been carrying
  this patch in my personal repos as a quilt entry where I would just push
  it when doing a "make TAGS". I also have the conversation still in my
  INBOX to remind me to send a v2. Talk about procrastination! It only
  took me 13 years to send the v2 :-p

  I'm still keeping the same Cc's. I wonder how many of them will be
  broken. :-/

 scripts/tags.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..018588014eed 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -305,7 +305,7 @@ exuberant()
 emacs()
 {
 	setup_regex emacs asm c
-	all_target_sources | xargs $1 -a "${regex[@]}"
+	all_target_sources | xargs $1 -a $no_members "${regex[@]}"
 
 	setup_regex emacs kconfig
 	all_kconfigs | xargs $1 -a "${regex[@]}"
@@ -334,6 +334,7 @@ if [ "${ARCH}" = "um" ]; then
 fi
 
 remove_structs=
+no_members=
 case "$1" in
 	"cscope")
 		docscope
@@ -353,6 +354,7 @@ case "$1" in
 		rm -f TAGS
 		xtags etags
 		remove_structs=y
+		no_members=--no-members
 		;;
 esac
 
-- 
2.53.0


