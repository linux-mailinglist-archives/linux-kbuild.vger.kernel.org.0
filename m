Return-Path: <linux-kbuild+bounces-13999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HdmyGGDmVGoTgwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13999-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 15:21:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C674B7EB
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 15:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S1i7HTps;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13999-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13999-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D4863049859
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jul 2026 13:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD6641C31D;
	Mon, 13 Jul 2026 13:14:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2275541C2E8;
	Mon, 13 Jul 2026 13:14:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948471; cv=none; b=tRF6zj+m1be/xriiifJL72sZSYk8UV8zWLvGLaiV6uiFLpj1t05+E219EZCReIRRMsoYXojv/CzuRNBD58WWV0bDzjtrGcGjqzVbdvQXcYy4gRCw+SvLnx7r7iaQLBcMKdv1bK9Cn7wmjJN68RgNDFmeYjBL2unrTdOoFU9Oa8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948471; c=relaxed/simple;
	bh=fdegTugRSI5n6nbecleJY2cwXJvIa/uop0CrOpi1+5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QfALwlSs0xiK9bZzKXrgKhAhf5CnE1bQoFvSQbb2FAyQD05spngDQ2v/tUPVwKq45ZRAwIauhO45FMLi0rLx8aLHps42LPMnxlJsrDsnyoqklihUxx2d4KveT1y4g9z9Ip2MN0Gz8+Ej/h6HYbW1VX7YPxMCC0UZezZw80fcweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1i7HTps; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2B3661F000E9;
	Mon, 13 Jul 2026 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948469;
	bh=EQL+f2aZ7TMORkfcws8GAgNxRUzGkGo15u42B533zXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=S1i7HTpsLBrxILoxoIUSVKG7wd79m3ePch6lkDK/H+/paD3Z4g+L3eo3u65YCrJKN
	 s/nzwSW6HxO6OYKyZHsZUnoyWvMZZ2rEP7dQf6rsdBCWJkQmJEorw36LnRwyfPOIlF
	 RVxXGuaQAgcb+xszkI67J7v7ZtOAWndBzND80cnxoHtsJGIOoQ8fJYb8MO2H8qv+pM
	 YmXhu3Jcp1dGO7nL5Iq1kytIpZLdClwNXlBKac1sSozrrPGHtr7x5YxuZA3UHnM2cI
	 m91MZf+u6/JfV35oLQqQNko+kMFUDHC/P5vTxEfjTNrrPBPX3fiAalK8LNvTVuAz8S
	 OMGRVbYKhSlug==
From: Nicolas Schier <nsc@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Nick Huang <sef1548@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
References: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
Subject: Re: [PATCH v2] scripts: headers_install.sh: Normalize
 __ASSEMBLER__ to __ASSEMBLY__
Message-Id: <178394806324.708590.9449082062118986951.b4-ty@b4>
Date: Mon, 13 Jul 2026 15:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=fdegTugRSI5n6nbecleJY2cwXJvIa/uop0CrOpi1+5M=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqVOMl/nNONS3Ub3PO+ENrwSDW3vk3VDyVyNZt1
 Rq3dES5fyKJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCalTjJQAKCRAHUgpwFiYS
 aWtZEADLPhQwyVSN5v1Nw2YbesobGudQtbJyeKSwQdgBxwKcj9+m9Bs9iw/ja83b8g5S36nCUhB
 B4Ru3SYjw5sQMRFbMDlHLjdfjgUflyOR/tO1Bbp/dcmbnhvElxbj2AFnSLp2Wcbzrlg+9qU7Kmf
 SNwxaRAU/oifUbVfM8oMn4aBM6nlR2QubfkKUNGpW8it6h2uXxk1BhLt+njOy19u4L7oeYi+My2
 vSyGbSLhPmg94xgfn5+SenuuQympoxJ1cDKnZkuDcejM+7KTQ9hnG/YYS+nlzKuR5KELYcTLdSl
 UP0GOUH7hiaCyMdhfU47s7/ws22QrehzVuHrPNgeW+1AhVQQyBxNUO38G7Ue3Z3WDaqpoKggfhS
 reBhkywqE76B2MIvS/8z9I4eK4BisMvbxY5oJqMhh2pD9S+r32TLO2qOdNBFDP5Tn73v7jdrmuh
 ArKqdmX7Ao4jGJWRyOud5olm9HO+Xl3f7OcQxRESoU25oPgxn3sStR/iYNeCzrbgsHz9VPBr9VZ
 NYMLXZ8fiWyGU+/JJObZddfCwNI0F3ONLojEDFM01aN3WKOdOOgNNSepbvJ9gx4DcEDvDrQiHaC
 wyIJoDxxcs9p80jgydCE1Vr+CmW0MaL3ngw+LI4hW94FQbSjVgwrOfEJe/+DlGnNjRZLZ16zsU2
 IkW3SuOT2w5tsbg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:nathan@kernel.org,m:linux@weissschuh.net,m:macro@orcam.me.uk,m:sef1548@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13999-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[orcam.me.uk,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF5C674B7EB

On Tue, 30 Jun 2026 23:15:00 +0200, Thomas Weißschuh wrote:
> scripts: headers_install.sh: Normalize __ASSEMBLER__ to __ASSEMBLY__

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] scripts: headers_install.sh: Normalize __ASSEMBLER__ to __ASSEMBLY__
      https://git.kernel.org/kbuild/c/a6c31a60

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas



