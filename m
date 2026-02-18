Return-Path: <linux-kbuild+bounces-11332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Jv2AQQmlmmIbQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11332-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:50:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6A159920
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 788F3305562E
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 20:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159B63491CD;
	Wed, 18 Feb 2026 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5uT+x6y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6759347FED;
	Wed, 18 Feb 2026 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447747; cv=none; b=C36RH5nlXzLWtf+jbwVnftXanhh0/8LzQaqh4jydHeIQe7nSb1+hHymvMDrgjIXBIpMxqZ32lO7PY5G9mYuy1JOySC0Nr76rfG41/fUoe7dUHWtJ3B8botwoAti/bmU9IMDMvdNqf/deDovPGMXllRvhagZGFHlR6uNbXWnUD1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447747; c=relaxed/simple;
	bh=PlmPBj8TZCjsYePHS07VOUHDAcaaD0lAypmvUK8Z+lM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SUTO8huN/igbNNR5aNzHGUDX6672/ToDemKqWgKphvog8eBXUtegnIvZzsVW5CRmJa3evd2k7y9vLopAxKWRhl3BWr57HFewNphY217dgF7vXcElLVNR/Xbu/79hT3Qklkeabr70tkweIuEML/1Xeax0wJjNTPFuY7/RHARmHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5uT+x6y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C1EC19423;
	Wed, 18 Feb 2026 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447746;
	bh=PlmPBj8TZCjsYePHS07VOUHDAcaaD0lAypmvUK8Z+lM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c5uT+x6yGtpWWr6CyONFwjLJbIGQ+rzcmeMz8BqaVI7M4kHlQuPDGAaUiG6abFfGC
	 gaOJHZcBIaTUxGlocMlFTTR+jdsDpvzrOlgV9DiqUms/D7sNbndpfNZXB7WTkP7gUA
	 /xILuLRTzvUr7I1kgfPEjGTR8l3CAfsub1kITIORPsavp/3k9iSEDR+twxiiGn503q
	 +ZwVWaB3v3/O6sSUWhsUQwwGHu6X7HxyLathKyKDOCMhs+MMI3xZw0paF6RrxK/Q9s
	 eOpFbPnn1L+2ys9K35Tt3/gZP8KgLaEKnNw0zyosewDBhz07k1a/54kVFm1tdDPDXt
	 umqSCzeWjXr4A==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Steve French <smfrench@gmail.com>
In-Reply-To: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build
 regression with RPM < 4.20.0
Message-Id: <177144774521.1769768.16136759849288029825.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:49:05 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11332-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EE6A159920
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 00:04:47 -0700, Nathan Chancellor wrote:
> Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
> Generate debuginfo package manually") on RHEL9, which has an older
> version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
> issue with specifying %files for a -debuginfo subpackage.
> 
> The first patch restricts the new -debuginfo package generation process
> to CONFIG_MODULE_SIG=y and RPM >= 4.20.0 to ensure it is actually
> necessary and working. The second patch restores the original -debuginfo
> package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
> build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
> -debuginfo package around for older versions of RPM.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/2] kbuild: rpm-pkg: Restrict manual debug package creation
      https://git.kernel.org/kbuild/c/6d6b8b0e28c46
[2/2] kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package
      https://git.kernel.org/kbuild/c/ffe9ac1ad56df

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


