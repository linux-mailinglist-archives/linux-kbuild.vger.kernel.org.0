Return-Path: <linux-kbuild+bounces-12944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN7LGOeq8mnLtQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12944-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 03:05:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5D49BEBD
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 03:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F4C03023324
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 01:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D93235045;
	Thu, 30 Apr 2026 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZuI78Ri"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58BB1A9FA4;
	Thu, 30 Apr 2026 01:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777511069; cv=none; b=o2TXYQZ/MxTxE17paDhJxkgiZQ9v8UofWNGZkcZfffF/EQGSyGHBO6CFaHDaxpz3dEMGrTb5K6VDwU1N1Wd2nWIgsVoYotqXV5qM1AIt80YpZnI2DdW6rgEVIYSekRtHv0XGEwoP1u/Mqnv10yxcHlT5Na5mMqxBWyTYCprkTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777511069; c=relaxed/simple;
	bh=GTCGLKihTuWP1sORw8KOdgxbbzF/xjg0bkw+1zXWbZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Rl8ErBAhnmGQOVYeTrUVsvx1VpNbCyk2ikohlVTFGyXAb7Y+LENf4HIK/cUvUFTmy8bY9C6vx/2Xvu2JtzDg1uP0lHzlfoUFQjW8eli9zq7V0irgN20jbLi8g4F6WxtU++kU127Emd1v9FLvNjoD42c/rYYdfA6Zw7VZWaDTADg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZuI78Ri; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D2CC19425;
	Thu, 30 Apr 2026 01:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777511068;
	bh=GTCGLKihTuWP1sORw8KOdgxbbzF/xjg0bkw+1zXWbZ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aZuI78Ri59Pc4kzgK5/4eUlf8+m67/uoB1Qi0Tz1nrdWj5fwbeo3h97oaBduS1Rrh
	 xqENiEqmg4W0xH6SHjREnLOKXilrYzT3BVwSgAdWbAzAbOSa3yNOauycrg3Z85nNcc
	 lpNwWQz+LsxxR4hIeA0IzwX7TglaRJ1q33tFnag0skOD8AjRihXzatWMOj7DIUAPGM
	 L1ZXlSRfIvckwqhCsEECjnOi5pYO148Euz09bzQmygvVehZ83vagTphgC+a4Qv6jL2
	 aez9J4pW3f98TtVJ/+pdAwaROtRUkNzugBjOGXIeD4Urk8TDXeO8663rJzfi6AcXq2
	 ZkRZmfEhrxseA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Masahiro Yamada <masahiroy@kernel.org>, Sasha Levin <sashal@kernel.org>, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260410131343.2519532-1-petr.pavlu@suse.com>
References: <20260410131343.2519532-1-petr.pavlu@suse.com>
Subject: Re: [PATCH] kbuild/btf: Remove broken module relinking exclusion
Message-Id: <177751104332.3341838.8867761635542688268.b4-ty@b4>
Date: Wed, 29 Apr 2026 18:04:03 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=727; i=nathan@kernel.org;
 h=from:subject:message-id; bh=GTCGLKihTuWP1sORw8KOdgxbbzF/xjg0bkw+1zXWbZ4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfVk3fJVyddo9hysS2Haq37gjVnzu8v3HSiRMyHf4pt
 x+ZBXFt6ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATyQ9kZLjA1bJlphKnd9nr
 ha/mb3jqf/31/z25tg/cdvgtm5qYIS/IyNB9o3v1/C+eeTNS74hefVF7etO39KDbTJUW59dz773
 w144ZAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: CEA5D49BEBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12944-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri, 10 Apr 2026 15:13:29 +0200, Petr Pavlu wrote:
> kbuild/btf: Remove broken module relinking exclusion

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kbuild/btf: Remove broken module relinking exclusion
      https://git.kernel.org/kbuild/c/d9ba1abcccdae

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



