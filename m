Return-Path: <linux-kbuild+bounces-13156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLn2EajEBWrDbAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13156-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 14:48:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CDD541E6B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 14:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A474B302B74B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 12:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679DF2C08AC;
	Thu, 14 May 2026 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPZHg926"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49826A1A7;
	Thu, 14 May 2026 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762855; cv=none; b=KQqW0Aeft1IIlTvfo9ZRuweQ3YwxSnzeqh9XIG4uRgGoqXZ8z9b87lLhoN5zFfqrLwyTQzZxYPCe2bsfvL2bWSkqPXleN86fRAj4KqJZ5bFFW9LjF2SDwCs9qvpga6wa0b2mwVv2enxTwVpk/6z9lpu8hrpZgJM1n/+r83DhtZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762855; c=relaxed/simple;
	bh=jIrIaHSGWGp3vWScRtj07eYktdAwsHQBNkU+nDer6Hw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JPLWjjgMcsCfNLMb0mj0PVmsrx7AVZmwLqa3DztbFxxj+yWz/5hshdkn9bpwP48ZTj3v8UvuWKC1KYSY2Vi/kPSplO7IjVQlLSJ3ZMkfZtphJoFcppg/iFm2yrzv238NMH4JFRmjhl5RT4Q9Vdag8+mjZaoTmMD19iwLe9LZHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPZHg926; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987B9C2BCB3;
	Thu, 14 May 2026 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778762854;
	bh=jIrIaHSGWGp3vWScRtj07eYktdAwsHQBNkU+nDer6Hw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CPZHg926LXqtCFWOqeqtIhtHVfTUf8bxdX3leZ+W62KMa0lwzNgzSgVgs72Wh30Cu
	 F4ZmOIn5KuY+gonPfYaJ0/vYXEvf0Nr0oa1NE1xRYF5lARiLn5HoxihJUF2QLYk4K0
	 ZE5TJZ6xIBHdmUayOVYDnXmxdzwKgM1npYbZbVzJWsAMM2O7b1bagxlKJXN6LHsM/K
	 3djsTv2k1VLK0NH2Kudx/Q5l2D8V4nKIIdAul39X/WzgvgIVbxb4NsT7HAJ8BwWoS+
	 VRfqJDl5c4ZekFhmcFRE0l5d6kDYtm5jbs9E3SmXoJjUUqadeIJe1mZl+K0AOei2Lg
	 UVx5PIM3Qp2DQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Christian Heusel <christian@heusel.eu>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
References: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
Subject: Re: [PATCH] kbuild: pacman-pkg: package unstripped vDSO libraries
Message-Id: <177876285334.4076323.14187523243144807265.b4-ty@b4>
Date: Thu, 14 May 2026 21:47:33 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Rspamd-Queue-Id: A5CDD541E6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13156-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 18 Mar 2026 21:37:20 +0100, Thomas Weißschuh wrote:
> The unstripped vDSO files are useful for debugging.
> They are provided in the upstream 'linux-headers' package.
> 
> Also package them as part of 'make pacman-pkg'.
> Make them part of the '-debug' package, as they fit there best.
> This differs from the upstream package as that has no '-debug' variant.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: pacman-pkg: package unstripped vDSO libraries
      https://git.kernel.org/kbuild/c/2c31897a17e55

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



