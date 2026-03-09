Return-Path: <linux-kbuild+bounces-11743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL7yNUwxr2kYPgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11743-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 21:45:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 405662410B2
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 21:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9738B3043D0A
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5028536C59E;
	Mon,  9 Mar 2026 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYQafrUF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C74F36BCC2;
	Mon,  9 Mar 2026 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089092; cv=none; b=f9x/jJf5s/wrfGewqgTHXgV9a3dxo6Bt3ptWI3IZFPl4a51fZlZK9Gnv2Dfq4bu8KfySA5r3p/dwQXOlRsEnqYQ1GFajuOO8V3iHMIQG2oSEwaq6Nyxe7/SROzN+/1rgJAI3yxOXN3yrdtJ/2g0rAOz4NG9OdGMMd6z9hHMl1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089092; c=relaxed/simple;
	bh=GyNX+I/9s6LLA2t8tmH1UDREqrQmIzE6V19hzhVluVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DHIFlzexiXx+yUFPHjHRmrEUh9JIGnEDj8OHWLf4lYVeWDgZwN+2KLeNitz0r9yb+qdSrpQCihVtVuXpO4nrRtFX+hi5r0YqhV+tuycOvC+I2gT+VVrzq5FuadsbKXssNurYVCx6zRAwE4W5eWRQPv4LkJSTZCL/LiYtmMmfLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYQafrUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2BDC4CEF7;
	Mon,  9 Mar 2026 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773089091;
	bh=GyNX+I/9s6LLA2t8tmH1UDREqrQmIzE6V19hzhVluVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cYQafrUFPm3xhZBrmMfqZqj+gz1GmZL/6BpYPNOpyXIxHWiRLTURguxLAL3NmevVO
	 wxv2ioDfUjvVmYD03F46uffIq45ImshaxpqXLtINS7s7C9hp+9mc0mOdMUNmO8ZqRA
	 P74XUPlAdgbKmjF/069FGFRTIar5eBz88Srtta/8NIzEMJqyA2WVWYMDUgWWNDdeU2
	 2h1L91qaejEVyWTFd5+JpL5BdTD2GVVYcAQzRFQt0OOKsRqakCaKUuEHP6E0FrSmo4
	 bhb75JIgnMk9dGyJ+oPC5Zff9LbqVED5dwzaP65M4At6lqYqakHaEd7gfay9Fb9AnI
	 NpR+tsOSXQbFg==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kbuild@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
 nicolas.schier@linux.dev, stable@vger.kernel.org
In-Reply-To: <20260308044338.181403-1-cmirabil@redhat.com>
References: <20260308044338.181403-1-cmirabil@redhat.com>
Subject: Re: [PATCH] Delete .builtin-dtbs.S when running make clean
Message-Id: <177308909004.2903875.11675921649031129590.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 13:44:50 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Queue-Id: 405662410B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11743-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, 07 Mar 2026 23:43:30 -0500, Charles Mirabile wrote:
> The makefile tries to delete a file named ".builtin-dtb.S" but the file
> created by scripts/Makefile.vmlinux is actually called ".builtin-dtbs.S".
> 
> Fixes: 654102df2ac2a ("kbuild: add generic support for built-in boot DTBs")
> Cc: stable@vger.kernel.org
> 
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] Delete .builtin-dtbs.S when running make clean
      https://git.kernel.org/kbuild/c/a76e30c2479ce

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


