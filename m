Return-Path: <linux-kbuild+bounces-10938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pJT0Dqr4e2n/JgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10938-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:17:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3668BB5D80
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55A463003987
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 00:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478FB23D7C2;
	Fri, 30 Jan 2026 00:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxfoPLeq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249821F5437;
	Fri, 30 Jan 2026 00:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732260; cv=none; b=Pp5NoMS00xUbDOuZlCZyiuswI7L85XuSCXTIhUuDoQnNsr/o+IJQcagbWdGBXiSRPg3eOmZqgzJnM5X634QuCG/b916no6cc8IKYKCBfKj4iB81dw1dlKA+jR19hHt7XTDY9EdaICIbtoQfxjgsQIc4pr3xTBoXbrlC2mEI3CC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732260; c=relaxed/simple;
	bh=rREZ37tFgmMVHxsCH/VwEDtlOhX6q+2g2C5Wj9vcirU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YcZQQCZ79Ju1C5eeO4ql0prU/zGcrsjOUSbagpb4Dwls44kwePGnUqz8BJjH6wwYj3E/RJpIOcG4Yv2l0bQkKeoY5H9UX12XgCBChr0gN/4Kq0JRAoJ4pKvGn36DgXpYbIgM4V/IPiA4+s4/ASW3M4XcHkrHZ/Eq9qNdjdX6rRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxfoPLeq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B1DC4CEF7;
	Fri, 30 Jan 2026 00:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769732259;
	bh=rREZ37tFgmMVHxsCH/VwEDtlOhX6q+2g2C5Wj9vcirU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZxfoPLeqXGQu+epp8ITq+FSiQe19owD6NYV8SRD/JOLXjpLDsDDwzRY0bfOHW2uel
	 Yrcfe3KoS3hunAfIHMwYJqXcuioo4A4N/ZbEC47CR+RN4q0C/r/MEb8ohkHtBQT2Dn
	 pwQHed30gqi7wnLWY8BMVw3wXDkOtcGpqD+DKGMAsF+QgGyhCR2SteWmQf2VIXUlS+
	 0wt0q5vxTiQ8k56fNETdZKlqJGtgiiOHk2rGIHIlLY6Jh7fHY8wrNHcbHDg2Ttt44u
	 N6DHdvQqKqHr6VYlgFvm+nRBO8u6yfo5z0wsu1Itn+IPyEq21AsIVDTWQHIjlxM2Gt
	 p6PKOtgZXMikw==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260121105801.1827-1-msuchanek@suse.de>
References: <20260121105801.1827-1-msuchanek@suse.de>
Subject: Re: [PATCH] kbuild: dummy-tools: Add python3
Message-Id: <176973225791.178709.17831414346066426792.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 17:17:37 -0700
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10938-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3668BB5D80
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 11:57:57 +0100, Michal Suchanek wrote:
> DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy python
> interpreter to make it possible to configure this option with dummy
> tools.
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: dummy-tools: Add python3
      https://git.kernel.org/kbuild/c/76c73cfde7988

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


