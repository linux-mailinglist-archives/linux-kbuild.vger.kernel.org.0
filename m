Return-Path: <linux-kbuild+bounces-10937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN4xJCv3e2nWJgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10937-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:11:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F8B5CEB
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BD363032742
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 00:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C404019F40A;
	Fri, 30 Jan 2026 00:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMuVh7gw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11DC186284;
	Fri, 30 Jan 2026 00:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769731835; cv=none; b=e62NeROsbrqZ/pazcxEyE6m0b54PN3O4pXLnFfh17I3VacBO+FQ5fbi7afznG5JUHkLKrt5yuaEn7ccGIbtnzVBw0UMvYZjdgmEFuZRYwECzuZRht+fhPXkyK2/iZo7HqIBbEg5eoSHEJi4xTH9vLHj5YVzrLujnkvjdoXXraHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769731835; c=relaxed/simple;
	bh=LoS+w0ZJyUAygbEUyB/TLXVll6leIC8mDvQ4Bj6W2JQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pICU4r0xO1TO0wu2e61fgCCu3ICtC32lG9GA6INCJgoY8nfvwtZH09Z/HojI0XWDsKq7XZGibA84ZcFLUvkDZF9jvnPKsxn5x+AIjh2lzAIN2NFUp8G/rt1t0u4G8KskUJhPdPWjbX+UlRMe491qsNo+/UwDfUw0B0MfWdqLI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMuVh7gw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C59DC4CEF7;
	Fri, 30 Jan 2026 00:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769731835;
	bh=LoS+w0ZJyUAygbEUyB/TLXVll6leIC8mDvQ4Bj6W2JQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TMuVh7gw6JXexGrllsr9dTjSECTSFMDaN/8XLeO+zJV3DqNI7V5UomSyAxNHFHD/r
	 wRzzJPUdYml3axmoaiqr5YXs/tzLQohgWgid9+G/IXHHGfk3lPtbV7VgXvvaCPI1xZ
	 lRU3q1oRqaNF6goHpZpqppTaApsy2xmrn8amXSwsF+kKtAhU/Ukfx013U4oDL8FD8f
	 i5/nGMcaChg16Kkbi6npexFVqMmRrLwcVYAOoY7uVOqzm9r5s/wRKbIDKe171vu76B
	 P0wEu8qTdtQrMJvXn+mdSSkWlEpYcJnTSMPXkF5hNkXB4C4jKRxIRrzS0pbSvUlPFt
	 6N/382UIPrCHA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Rapeli <mikko.rapeli@linaro.org>
In-Reply-To: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
References: <20260122105751.2186609-1-mikko.rapeli@linaro.org>
Subject: Re: [PATCH v3 1/3] scripts: kconfig: merge_config.sh: refactor
 from shell/sed/grep to awk
Message-Id: <176973183385.175491.5659819632977597738.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 17:10:33 -0700
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10937-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 138F8B5CEB
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 12:57:49 +0200, Mikko Rapeli wrote:
> merge_config.sh shell/sed/grep loop scales poorly and is slow.
> With Yocto genericarm64 kernel and around 190 config fragments
> the script takes more than 20 minutes to run on a fast build machine.
> Re-implementation with awk does the same job in 10 seconds.
> Using awk since it is likely available in the build environments
> and using perl, python etc would introduce more complex runtime
> dependencies. awk is good enough and lot better than shell/sed/grep.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/3] scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk
      (no commit info)
[2/3] scripts: kconfig: merge_config.sh: use awk in checks too
      (no commit info)
[3/3] scripts: kconfig: merge_config.sh: warn on duplicate input files
      (no commit info)

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


