Return-Path: <linux-kbuild+bounces-13907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3NocFOwqQ2p4TAoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13907-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 04:33:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 947746DFCC6
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 04:33:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OJ44iLgF;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13907-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13907-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F53C3005D24
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 02:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E113749E0;
	Tue, 30 Jun 2026 02:33:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACC3372050;
	Tue, 30 Jun 2026 02:33:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786791; cv=none; b=el6PncuZd8L8MQgR/+M9q6NC+LXud2txy7RTGoqJTt4T0B9RgDGWAsz+TrYV/NSnn0rI/yhnAZTNt0DFjDGrX+kx0Mqej20xz3U9FJzZFNQ47ktgwVNxcP2UE+9EWjUcg3B5rCGmKTT23NhBx8vFYi8sxYy3lmcJFvxMGyebOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786791; c=relaxed/simple;
	bh=TzSHGVYYEi+DXI7utkyD0I67W+6YdqIhIl20VJzebN8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OeFtWCQH6/1vcPG6CYKHPxgHQYJnsVKnK2rJoFXSi/tqJJqtwMkKFqdNEemo619x+Nvs5q4DpK1iVzx9GesFnWS2TtANNLV3jAUGdHoMIRKPHM8eh+3tyIhfXwqUIrbfZLYNoa/Mb+qngR5OwIDYQhrm1KNNI+b8QcEQK9wmt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ44iLgF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5291F000E9;
	Tue, 30 Jun 2026 02:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782786789;
	bh=gO2x5SG5YeuhyIW7JG6Tb2esmXNB5mhH6zzhpwYGI90=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OJ44iLgFv9IXnuK3HqMxUaAn44aEtZGHMldLE6jKAly+JCOgDsx7/7g9NscviFEkT
	 FRWPP29cyCrNopVPKo9BWXDusCW7fsvcyh+WQdPweI/rK1ZbrhVP6mvzKd88BAHn/j
	 esU1yo0vzM8jCBbLmw5iJ4LOGzkYHgm/FpZz2iNHxtVYsHG9AmuyPP4YAzU5YUkWYX
	 u/OZDeWuM3gRxfzVKFdF/g66TIRpYxiOmC16CldchbHFeS6fjscg4Cuog1LM2wvFzt
	 opJxeWhIeNCNWMRbQpMbHMLMEIfls5ADCR2xDVOcdfg6km2lIq+vM4eBPAsJbJ6+UU
	 W/fkPflUy6/6g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: remove srctreie path from CHECK output
From: Nathan Chancellor <nathan@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260622132653.446868-1-ben.dooks@codethink.co.uk>
References: <20260622132653.446868-1-ben.dooks@codethink.co.uk>
Date: Mon, 29 Jun 2026 19:32:37 -0700
Message-Id: <178278675710.3414597.12868097497271294239.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=nathan@kernel.org;
 h=from:subject:message-id; bh=TzSHGVYYEi+DXI7utkyD0I67W+6YdqIhIl20VJzebN8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnOWk/4a16ZH17y6PKZlVopp0+abvrIuezFcUulFr0jH
 MVx7udmdZSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJ9HEy/JV7XGnzj8XtJOs8
 ybgFL2eZvj/fH3Xm37QZ+9IPvqyTqXdm+B91rIdL2/TpO+1834dTS2TLhTZym21InBzWbfSjPCa
 ogBsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.dooks@codethink.co.uk,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13907-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 947746DFCC6

On Mon, 22 Jun 2026 14:26:53 +0100, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

Hi Ben,

There is a typo in the subject.

>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 911745743246..d432693e5367 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -159,10 +159,10 @@ targets += $(targets-for-builtin) $(targets-for-modules)
>  
>  # Linus' kernel sanity checking tool
>  ifeq ($(KBUILD_CHECKSRC),1)
> -  quiet_cmd_checksrc       = CHECK   $<
> +  quiet_cmd_checksrc       = CHECK   $(patsubst $(srctree)/%,%,$<)
>          cmd_checksrc       = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  else ifeq ($(KBUILD_CHECKSRC),2)
> -  quiet_cmd_force_checksrc = CHECK   $<
> +  quiet_cmd_force_checksrc = CHECK   $(patsubst $(srctree)/%,%,$<)
>          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>  

I don't have a strong objection to this patch but I know there are
plenty of other places in the build log that will use a full source
path, so this doesn't fully address that inconsistency (and I am not
sure it is inconsistent to begin with, as most build targets are
relative to the build directory whereas files from the source tree have
to be absolute when the build is done outside the tree). But this seems
reasonable enough.

Acked-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


