Return-Path: <linux-kbuild+bounces-13923-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h+CkMHVTR2rUWAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13923-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 08:15:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D76FEFF2
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 08:15:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MTvzFun1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13923-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13923-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EED5D30055F4
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 06:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8519C379C3B;
	Fri,  3 Jul 2026 06:14:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680653655EA;
	Fri,  3 Jul 2026 06:14:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059291; cv=none; b=btgXT3CY8AVuJkSbFKrPnhQym8/gta1VjV5K6iY641lL4X3o0JHY42adTHhTUZqpGDDvYyQkywXJRT11te9/rsjpn2UZrQgjYmNmL2WzPIfZ5CyW22+YhcQugWqSESM1NVlvehybmND1fKJW41A180/VFVm+F0ycdVelw/mmZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059291; c=relaxed/simple;
	bh=PvwMaUW4Bhmw1g5dfJKPfAVS5JInTqp7iiYy8ZWASMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y/x+7KQVLL4FdRbSoBCxO781IjpbXLEZ5dIcr4bLiBevH/Iz/k6hFvyDwLtV+iTJRPcVgbhvB1LrVmoD2gvwjddhu6aVUfIcwVRrCsQQk5UZY4ZJqAQFDHoNFjMBBJLCkIz/QYuIThX7nqKsD9dTMM+0LU1hbtvwmOlP3Mu3ScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTvzFun1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246801F000E9;
	Fri,  3 Jul 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783059289;
	bh=KAOJyjNnpeYBSx4Tg1/BVABssxBZm7QmG3pOSwCDZkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MTvzFun1K591GJM4wnYNvOmQskcRyrpAbTcoanXq9zmzv9q9jBIR3KRJrS0zDcrGI
	 gWYKP7glOQZC4WJE0ZtIeU32neYDA5fXnlHLAsL1hVv1N0EUmbwnXHonoEXxKEq3kK
	 TlUtwpU5cc4KbvJtST0DYBJ/98HefsQsrg0jCSDNP7KEnnz71Mzt8Ww3uPc1fQca/z
	 IalkYCmGUF4FRA6l7nCmFJjbcWMzSHx9ZuTmLhEUhuavRrDkUVcunMXTivj2DM8lmJ
	 8VSn6ycIzu8X22Yy7cA//lglxYrdnhO3JmZYKYMnGmJ2DpSARN+SzpR6O5s11KuqrW
	 tweNLmdwd5JqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, "Miroslav
 Benes" <mbenes@suse.cz>, =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <thomas.weissschuh@linutronix.de>, shuah@kernel.org, "Zelin
 Deng" <zelin.deng@linux.alibaba.com>, linux-kbuild@vger.kernel.org, "Petr
 Mladek" <pmladek@suse.com>
In-Reply-To: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 06:14:48 +0000
Message-Id: <20260703061449.246801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13923-lists,linux-kbuild=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:live-patching@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:mbenes@suse.cz,m:thomas.weissschuh@linutronix.de,m:shuah@kernel.org,m:zelin.deng@linux.alibaba.com,m:linux-kbuild@vger.kernel.org,m:pmladek@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,linutronix.de:email,vger.kernel.org:from_smtp,sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA8D76FEFF2

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete fix and inconsistent state: The patch correctly unset=
s `sub_make_done` for the `kselftest` targets to allow Kbuild command-line =
reevaluation when building external kernel modules. However, it fails to ap=
ply the same logic to the `tools/` and `tools/%` targets, introducing a dis=
crepancy between build entry points.
--

commit 06c418388d65deb3d8494a6e8e7071c0e709186b
Author: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

kbuild: unset sub_make_done before calling kselftest build system

This commit unsets sub_make_done before invoking the kselftest build system=
 to
ensure Kbuild reevaluates command-line flags when building test modules. It
mirrors a previous fix done for scripts/install.sh.

> diff --git a/Makefile b/Makefile
> index b9c5792c79e01..f717a4dc96d6a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1591,10 +1591,10 @@ tools/%: FORCE
> =20
>  PHONY +=3D kselftest
>  kselftest: headers
> -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests =
run_tests

[Severity: Medium]
Will make tools/selftests still fail after this change?

The tools/ and tools/% targets in Makefile delegate to the tools build
system, which can also trigger external kernel module builds (like bpf_test=
mod).

Because sub_make_done is not unset for these targets, invoking commands like
make tools/selftests or make tools/all will skip Kbuild's M=3D argument par=
sing.

Should sub_make_done also be unset in the tools/ and tools/% targets to mai=
ntain
consistency across the build entry points?

>  kselftest-%: headers FORCE
> -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
> +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests =
$*
> =20
>  PHONY +=3D kselftest-merge
>  kselftest-merge:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-makefile-u=
nset-submake-done-v1-1-6899248f3d6a@linutronix.de?part=3D1

