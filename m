Return-Path: <linux-kbuild+bounces-11333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hl/CCYmlmmIbQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11333-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:50:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4E15992F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 636AF3061479
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 20:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9F2349B0C;
	Wed, 18 Feb 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egAWHzpw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0333EB0A;
	Wed, 18 Feb 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447748; cv=none; b=nrLoJRPjhRkyDKf+8RvAC1yjK3UGY+sBwCch84XIrQWVqDhzz3AslyWaql6yuYuQfammKxMCkoXZvmwhWY1/xzmbdLyJCZf0Vxwg084ZUZs0MTh0i5O4TlDUWGeZz4L5I3aOPQGGzNm8O8MGGFSf0A7tzLphUICPMWh8Sd+tmt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447748; c=relaxed/simple;
	bh=bxWWyHSrf8/A4PvPHv9QtZLk5SicanqgXuFDfx7pFQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iDeKfASiAtwNcfn+x8LunjMZWeDxAoTCLVdEtHfTqcqngI40KUy9YPOBKQdW9CaeO9m1GbHjO6iQunTOqVO/ijVK47TMULPjtc+cve9/OWuGqCcW7iRe+f83Sc0NrzK2/PQDotPH/Cs6vGY6wIEHXtbyi5MuKsZBNHv99Ku0Axk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egAWHzpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE1DC19422;
	Wed, 18 Feb 2026 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447748;
	bh=bxWWyHSrf8/A4PvPHv9QtZLk5SicanqgXuFDfx7pFQU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=egAWHzpwwSzfpCk8RSqtNBNRZ80GTWT4/5pIpC7mRgDkDp++mHLPogPh0CPRVmKtT
	 fCA7616oIeoieLVkfdeDSHgFuqGmYKVVtO6+yIZ0rB+tyruZOCE3X7bMiuy2CGzMf6
	 Z4eXgqcihBE96NZ7iWXZNgQNOJVitg8w3K/c3MLVCb5suLzVNe2NaPcZ/788DMI5IM
	 3pKBqSe82Hd9KhXK0gUr6Ov6FsRY6YVXmxd4YPPmkEYAVQnZFWXrNEo/GuWVmgBf81
	 7fb0FDGRiS+6E+ecilleiKQ2YZFTfokhA1agU+N3Kns7gwJV8ekNIO1lsYaXT4VJuQ
	 BgUN8g5UbIjXA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Lukas Herbolt <lukas@herbolt.com>
In-Reply-To: <20260213-fix-debuginfo-srcrpm-pkg-v1-1-45cd0c0501b9@kernel.org>
References: <20260213-fix-debuginfo-srcrpm-pkg-v1-1-45cd0c0501b9@kernel.org>
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix manual debuginfo generation when
 using .src.rpm
Message-Id: <177144774696.1769768.10484893215467443887.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:49:06 -0700
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
	TAGGED_FROM(0.00)[bounces-11333-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77C4E15992F
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 01:45:13 -0500, Nathan Chancellor wrote:
> Commit 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package
> manually") added uses of OBJCOPY and READELF, variables from Kbuild.
> These variables are defined and work properly when using the binrpm-pkg
> target because rpmbuild is run within Kbuild. However, these variables
> are not defined when building from a source RPM package generated with
> the srcrpm-pkg target, breaking the build when generating the debug info
> subpackage.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: rpm-pkg: Fix manual debuginfo generation when using .src.rpm
      https://git.kernel.org/kbuild/c/afdfb71c018e9

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


