Return-Path: <linux-kbuild+bounces-13610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dTPgJ5ibJGqX9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13610-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 00:13:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC464E76D
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 00:13:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=lKuXQOEF;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13610-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13610-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B2F43035837
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 22:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D5E33C518;
	Sat,  6 Jun 2026 22:12:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781530C166;
	Sat,  6 Jun 2026 22:12:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780783973; cv=pass; b=rCclryugEbUowQd4oCfOTcVpwUWLZmMs6oqUXi3DZhA4h6xM6GNxlmMDqZ6X8rdrj69BTkXBfwOEWL0VjpuGuVtO5LheyLjDRkMZmAAO3fCFBayBXFn9XdX63zpmukcT+odHyOSuAxc9dvRRUturQv9djXrxfoBuhaWGbENjJeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780783973; c=relaxed/simple;
	bh=311dWqECn8Ud8GO1Oo3fDuNMQJKLVZ0R1SmQOnBD2ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvNQ2yKOXn50JUnNXla/F7GMgJccLubFyCMxoot8QsN7bmfBzqxugDs0wG0NSkaUtWj/0P00jeSTAtfjqp38ju4ZR+2yhiEFxVORP0fFCuCKUs3lvlhxpyMSDkKp06Oaclnc91kvRIoBycaslzPu3VbqP9x5vovrnJXsl7fUrlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=lKuXQOEF; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780783966; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i92uvlhCrqxPl3duQLweMzP+LoHSmKHmBsROUWayb9ei7FNJEduCkGw53fGhTGb0SZHSAyFv86eF9Tj18nHiL/Ix2F1MIiqBZt7Glyd+DlqfhrKp+Y1H3bM/vCLVjqeKzC08KB0P1pax61E/ZS9gcaq5v//cu4S2g5o241ZxBnc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780783966; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r5BaDtXtSWBegRS1sSzl5ZrQ7MUzeyL4GUQbwM3pgP0=; 
	b=Khk+4SC2mFdAyByIzcM4/cFVm7xLlDMv2A83wzU651IeTNXUc8HhmEgoIzLkADgG2CMiMUi43jZ+cxQ0iYxzIqlYZGs1VgycZXy4SNksvUhWe/4n4dEbPtOAnrJxCswHcom26it/Om4gGKJPKOl1GsTt/zPw/Kqc9zPla32lkHA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780783966;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=r5BaDtXtSWBegRS1sSzl5ZrQ7MUzeyL4GUQbwM3pgP0=;
	b=lKuXQOEFsgFo+RXKYzZUg3s9TOHMWg2RfcBx59QJQq4Q1WOglhHJC1qYFzwRqK5/
	xu4jPGNwtUcTx/4QFNjE4jvWxK0p5fOmo3Xjel6GOI08t9xVw+JEWk4NCkHisZs1E1H
	RnwlS4Uz+GuO2E4KAIvyZhH5ZomTeuCcmFhHi8lqJ9toOEMTR73pd50NleR07BU9PPf
	GRoNybVtjGU+c/585790LNW+QoY0LqchM/HC9uXsCh+bthYgLxkrxesyXiZp2DRiytv
	ONgCmoHPXRoOaU18omvznEAavmJ9MMWPpPhYfykFGcxrNpCWr9ibyNzkErcJMm8YzPJ
	wyp0NMCrOw==
Received: by mx.zohomail.com with SMTPS id 1780783964653715.3159320139267;
	Sat, 6 Jun 2026 15:12:44 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 07 Jun 2026 06:11:32 +0800
Subject: [PATCH 2/2] scripts/config: Use in-place editing (-i) in sed
 portably
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-config-sed-v1-2-2ff7e35de271@rong.moe>
References: <20260607-config-sed-v1-0-2ff7e35de271@rong.moe>
In-Reply-To: <20260607-config-sed-v1-0-2ff7e35de271@rong.moe>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:i@rong.moe,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[i@rong.moe,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13610-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02FC464E76D

The use of in-place editing was removed by commit 83e8b90e1d2c
("scripts/config: use sed's POSIX interface").

Before that, the script used bare `-i' to enable ERE while skipping
creating a backup file. In fact, mojor sed implementations have
supported `-i' for over a decade. It's really doubtful if anyone would
still compile Linux on a Unix system without it. The issue is more about
how we use it:

FreeBSD and macOS disallow bare `-i'. To skip creating a backup, an
empty string ("zero-length extension") must be passed as a separate
argument following `-i'.

GNU and other BSDs accept bare `-i' to skip creating a backup, but
disallow passing a zero-length extension.

That being said, when thinking about it optimistically, using `-i' is
portable as long as a backup is created.

Use in-place editing (-i) in a portable manner by creating a backup file
with a .swp extension (the same name as the current temporary file). The
backup file will be deleted on exit.

A rough benchmark with ~1000 editions showed a 14.4% speedup (5.27s =>
4.51s, GNU sed). The FreeBSD sed showed a similar speedup.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 scripts/config | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/config b/scripts/config
index 1f290372a4ce..6b6db22f5408 100755
--- a/scripts/config
+++ b/scripts/config
@@ -71,35 +71,31 @@ txt_append() {
 	local anchor="$1"
 	local insert="$2"
 	local infile="$3"
-	local tmpfile="$infile.swp"
 
 	# sed append cmd: 'a\' + newline + text + newline
 	cmd="$(printf "a\\%b$insert" "\n")"
 
-	sed -E -e "/$anchor/$cmd" "$infile" >"$tmpfile"
-	# replace original file with the edited one
-	mv "$tmpfile" "$infile"
+	# We don't really need a backup file, but in-place editing with backup
+	# skipped is not portable due to different implementations parsing
+	# arguments in incompatible manners.
+	# Create a backup file anyway to ensure portability. The file will be
+	# deleted on exit.
+	sed -E -i.swp -e "/$anchor/$cmd" "$infile"
 }
 
 txt_subst() {
 	local before="$1"
 	local after="$2"
 	local infile="$3"
-	local tmpfile="$infile.swp"
 
-	sed -E -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
-	# replace original file with the edited one
-	mv "$tmpfile" "$infile"
+	sed -E -i.swp -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile"
 }
 
 txt_delete() {
 	local text="$1"
 	local infile="$2"
-	local tmpfile="$infile.swp"
 
-	sed -E -e "/$text/d" "$infile" >"$tmpfile"
-	# replace original file with the edited one
-	mv "$tmpfile" "$infile"
+	sed -E -i.swp -e "/$text/d" "$infile"
 }
 
 set_var() {
@@ -142,6 +138,8 @@ if [ "$1" = "" ] ; then
 	usage
 fi
 
+trap 'rm -f "$FN.swp"' EXIT
+
 MUNGE_CASE=yes
 while [ "$1" != "" ] ; do
 	CMD="$1"

-- 
2.53.0


