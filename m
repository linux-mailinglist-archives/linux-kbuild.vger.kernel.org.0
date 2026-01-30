Return-Path: <linux-kbuild+bounces-10935-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAfXLvv2e2nWJgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10935-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:10:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEAB5CC6
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E00CC3011870
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 00:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098172AD20;
	Fri, 30 Jan 2026 00:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bV2HBPoV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E7229408;
	Fri, 30 Jan 2026 00:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769731831; cv=none; b=kmN261+mT+181gjraHVef5CAYYW7zWpfus7fQhRwGRy+gBVVYAwkHkf9tW/rfNKWaZIc70nw6zrqJihjlCwDx1BVzFDy7sh/xEBZ6+246pXUdPdqWMT8E52AM+nqLdgYS40nrlx5944lSS0//sI7VHlXKQsRvHJfpR1+hs7p+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769731831; c=relaxed/simple;
	bh=uCpT1aoAQoIgxEvOvkh2iuXiwJhn4Y56X/hb6Ii4gRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZpZIw2bzpMdato/+YjIvjE/E9HUDUrkGEhXA3wGz9etxRwmXd2loMVxL9bZyMa0VoamaVj0kcs5vNp74dWJIw3MkYN9FQPhs4DLRPlNyrwq16unPcqxRK8YaADjEtccm1WW+e1TgEUw0VkOvMxcUM/O2aiMhf0DXxI2G7KauGkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bV2HBPoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F16C4CEF7;
	Fri, 30 Jan 2026 00:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769731831;
	bh=uCpT1aoAQoIgxEvOvkh2iuXiwJhn4Y56X/hb6Ii4gRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bV2HBPoVUTxQiQ79xN2dIs2tU03jHP+yhoRFLq4NT/txaj4TDT7kbe1iT+2z6W6b9
	 zPNhc5nQJwNsmf2KCnEuFHxlfrGQuqbvg6bY1cXT73d5jLf6b+uPJwFEUjznsTaorF
	 wBptvrTkFbVU0ZlJTOWremYIveGPqyw1m2GrSA2LGt9oQ5X7uDpVxQw2nknv84L+du
	 3yA0b3D5Rcb2bt/ukzFZD0KipmSGBTqSRslB4Tlt+P1A+HltN+g01tJwAhEkWLgdxD
	 Kc/wKZi9VvNGrk+rJvO2pZ6NjtadCP64wO4Jb5ODgxWnRlnVOlPuxSyKRl67QN2CGc
	 9k8tQ5zClj/GA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Guillaume Tucker <gtucker@gtucker.io>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <cover.1769090419.git.gtucker@gtucker.io>
References: <cover.1769090419.git.gtucker@gtucker.io>
Subject: Re: [PATCH v4 0/2] scripts: introduce containerized builds
Message-Id: <176973182876.175491.11533873021129857298.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 17:10:28 -0700
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10935-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28FEAB5CC6
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 15:06:58 +0100, Guillaume Tucker wrote:
> This proposal emerged from discussions over email and after a talk at
> Plumbers 2024:
> 
>     https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
> 
> The aim is to facilitate reproducing builds for CI bots as well as
> developers using containers.  Here's an illustrative example with a
> kernel.org toolchain in a Docker image from tuxmake:
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/2] scripts: add tool to run containerized builds
      (no commit info)
[2/2] Documentation: dev-tools: add container.rst page
      (no commit info)

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


