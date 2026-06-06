Return-Path: <linux-kbuild+bounces-13609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ajPI2ubJGqE9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13609-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 00:12:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB83C64E75B
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 00:12:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=WQnQcDdZ;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13609-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13609-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64BD83020A76
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 22:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D6133C53F;
	Sat,  6 Jun 2026 22:12:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F9264A86;
	Sat,  6 Jun 2026 22:12:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780783967; cv=pass; b=uYagRWATFQd4dggfgZwZ4xWJj57KsVI2P/DyX1wqffPtn2UWsJUfy4gGNCezvOBiYQHkPjB/ygD7MEw2t+WJTOS3LLbGLjsNCM2+kn5ew2uaDivuujDCF9cp3vEJxAvXIldg/LiZlvgeE9e9vDN6lyWOQrCdSXEVYURbVJGDw+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780783967; c=relaxed/simple;
	bh=mGEvl8F3QsP+UsqM98dJ0np6VvxOefOK2xD2iNZK6zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FoCSyKVCkT6ECXQwuV4wOJyx3WIUII1yWPiIlQbF2vPDiy6OaTNFV2DdEDAGFF6bogZHAZtkzU8ZKaMYC9LqpRRnH8LGYDD580lKzvazkbJgRhSOfEAi8CR9R3wrEIWXX+I1oVp09EEOp+eU141CihBt6gIroKsjZWsJd6y/lJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WQnQcDdZ; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780783963; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=crZHB0NX88NCebn+ZGU6Og0a/2TwME3JrM+e0bMf8HoctwH8U+vbmPmLhz3gHfOYzjUM5UnjLxFwGIgr4XzRrBG9+5wyar32/1z4Oi4gUoY/UCej/qu540SXVT5vlp+aDLcDJfhMFe6Ax5OGBLnR1+/PNAs/yQZwGK1wtunVIuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780783963; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ztZoY9negWars0bczNfN1SLn09MUN8TUHPETpJ5Z/qg=; 
	b=iV6Q7NgToEGf+1OHwENwyhhiiFBkugrL12JIcRxxELSlhn7RUxenxJJ6pAjsiSSCl8BrkuTRBrxVa1TL7JOC6vL4g+lTiv7BaxkNxcVoF0+UaGBcnljMuNECjcrcyPGkSq05u3uXEjTfIA//O4mh98cCZluVof3DpDmv6f4s2Cc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780783962;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ztZoY9negWars0bczNfN1SLn09MUN8TUHPETpJ5Z/qg=;
	b=WQnQcDdZvZ0n9pqW/vZgZUfbhqvVC2FZVFwKKNwUwlUtqQgVV1vFzjHEhlyAwIM6
	Wm8g4uTHHIKCSkIFMvKEFPYOF4hgkN/NdxYEztvrVCozs0iDeGRU47+Dvq+juapYu7Z
	Dym3OQKSI217HtKBEsrwp1vNivsr9uwXTTl92Hc68EoE/sFzvmNLHpIobvlVe/YL6Gf
	W5CDRU0QTpWPSFcBko8yPvdtXew8JnCKHgftWOirGfr9V4ua8fSWBw1v5tZU2Gd8iVe
	WmlxDVdVZy2BUvIJLm6V/1YVlpWN9xK5NdPRwDsGw+O1/6g9bk9L/Oeg19Jlru8dcTW
	nYsQoFZ/Vg==
Received: by mx.zohomail.com with SMTPS id 1780783961261214.86449769378135;
	Sat, 6 Jun 2026 15:12:41 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 07 Jun 2026 06:11:31 +0800
Subject: [PATCH 1/2] scripts/config: Use POSIX standard ERE (-E) in sed
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-config-sed-v1-1-2ff7e35de271@rong.moe>
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
	TAGGED_FROM(0.00)[bounces-13609-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,austingroupbugs.net:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB83C64E75B

The use of Extended Regular Expressions was removed by commit
83e8b90e1d2c ("scripts/config: use sed's POSIX interface").

Before that, the script used `-r' to enable ERE, which is indeed
non-portable. However, POSIX.1-2024 [1][2] has accepted `-E' as a
standard option to use ERE for matching, and major sed implementations
(GNU, FreeBSD, OpenBSD, NetBSD, macOS) have supported `-E' for over two
decades, so it makes no sense to use Basic Regular Expressions any more.

Switch to ERE to get rid of chained calls to sed. A rough benchmark with
~1000 editions showed a 40.0% speedup (8.78s => 5.27s, GNU sed). The
FreeBSD sed showed a similar speedup.

Link: https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sed.html [1]
Link: https://austingroupbugs.net/view.php?id=528 [2]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 scripts/config | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/config b/scripts/config
index ea475c07de28..1f290372a4ce 100755
--- a/scripts/config
+++ b/scripts/config
@@ -76,7 +76,7 @@ txt_append() {
 	# sed append cmd: 'a\' + newline + text + newline
 	cmd="$(printf "a\\%b$insert" "\n")"
 
-	sed -e "/$anchor/$cmd" "$infile" >"$tmpfile"
+	sed -E -e "/$anchor/$cmd" "$infile" >"$tmpfile"
 	# replace original file with the edited one
 	mv "$tmpfile" "$infile"
 }
@@ -87,7 +87,7 @@ txt_subst() {
 	local infile="$3"
 	local tmpfile="$infile.swp"
 
-	sed -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
+	sed -E -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
 	# replace original file with the edited one
 	mv "$tmpfile" "$infile"
 }
@@ -97,7 +97,7 @@ txt_delete() {
 	local infile="$2"
 	local tmpfile="$infile.swp"
 
-	sed -e "/$text/d" "$infile" >"$tmpfile"
+	sed -E -e "/$text/d" "$infile" >"$tmpfile"
 	# replace original file with the edited one
 	mv "$tmpfile" "$infile"
 }
@@ -105,14 +105,12 @@ txt_delete() {
 set_var() {
 	local name=$1 new=$2 before=$3
 
-	name_re="^($name=|# $name is not set)"
+	name_re="^($name=.*|# $name is not set)"
 	before_re="^($before=|# $before is not set)"
 	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
-		txt_append "^$before=" "$new" "$FN"
-		txt_append "^# $before is not set" "$new" "$FN"
+		txt_append "$before_re" "$new" "$FN"
 	elif grep -Eq "$name_re" "$FN"; then
-		txt_subst "^$name=.*" "$new" "$FN"
-		txt_subst "^# $name is not set" "$new" "$FN"
+		txt_subst "$name_re" "$new" "$FN"
 	else
 		echo "$new" >>"$FN"
 	fi
@@ -121,8 +119,7 @@ set_var() {
 undef_var() {
 	local name=$1
 
-	txt_delete "^$name=" "$FN"
-	txt_delete "^# $name is not set" "$FN"
+	txt_delete "^($name=|# $name is not set)" "$FN"
 }
 
 FN=.config

-- 
2.53.0


