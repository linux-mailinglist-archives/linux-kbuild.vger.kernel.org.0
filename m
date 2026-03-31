Return-Path: <linux-kbuild+bounces-12396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PY8KLfry2l6MgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12396-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:43:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A136BF87
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDAEE3096D44
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E4041C2E2;
	Tue, 31 Mar 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1411tNI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A8411624;
	Tue, 31 Mar 2026 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971176; cv=none; b=f2a2LMnl7DaUYcx2qYHCLLs3KTR27ocs3AMVdfQdUFblqwI1jxVNuDWZukg6GdPb3eBXsxFVqiAR42G/junkALfSiEMH/E3wWtmWqVI46/Xd0paT7S8LNyz8N8GP/VFaX+Ptfq61KU1JZ5oPx6zpuYJEwu5NdypY5S/LysRIlJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971176; c=relaxed/simple;
	bh=aGjLeD+Un0VE8ssvCrTUeSr+Kf52CZBZsLw4CtomiD8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=M61kFQ0JIVFfz9XE0A66oExFmE8igf7KMo1h1RLqZXaS7qfNgmuUaBi+tqNQuCV2dMIS7vVoLkgrfr49SMczPU4lBch40z+rEsBSfMXIf54lvl2ZEkV++2K/q3H17uurDXULIIOb99NjmvsV6/islNRjPQw1s9eHX3oti906c1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1411tNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AF3C2BCB1;
	Tue, 31 Mar 2026 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774971173;
	bh=aGjLeD+Un0VE8ssvCrTUeSr+Kf52CZBZsLw4CtomiD8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=F1411tNIIvCeXJdGwxKYhALVX7eTn9n6VwmUaDU/TCEGfL3GoZO3WjeWNQok4AZNB
	 0a0x4BVYyUdzAMpnzQP1c4+8szm5HwKnDPnoRH0QpjfzBYh7w4GQD87wjxn4MaHZX5
	 R9JlSRc3IKSHQj7OBuRWmR2pLamN+qnLnsRW3o6mPsR4DQlp7w5unCnOxHaP7lY6MI
	 fhAv1HXAMuwuDRuNiH7ZNq7iFZH1c52PdHQ8B+zwmnmPNOnFMYjrBbAx/5OWQDDG6s
	 hdRLaufTZwbRQVi/b1wXsBckwutG93PzI1UTv1xJjA6HrbdueYyYk9Z/BtsGAQqbwZ
	 sV2iQAkFV74aw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] kbuild: vdso_install: split out the readelf
 invocation
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-kbuild-vdso-install-v1-1-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
 <20260320-kbuild-vdso-install-v1-1-e2e8a0970889@weissschuh.net>
Date: Tue, 31 Mar 2026 17:15:33 +0200
Message-Id: <177497013326.2338582.14860758111770120240.b4-review@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=353; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=aGjLeD+Un0VE8ssvCrTUeSr+Kf52CZBZsLw4CtomiD8=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpy+UXBqFA+UejxsliP85OlMEjkvB4yVvoYVCMi
 tf7tg1y6qOJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCacvlFwAKCRAHUgpwFiYS
 abS2D/9LvB+hZPSH4L+07OY2Uq4rAwQjxW7M5MSAfUo7Fq3bU/WoS99Qfqz7ilqMKGazcL5GVmA
 49OoL6XjD7Iho9wW7w1Aohdry6mN81KBrg5Y1CBc16YnjMSgcu3ZEQEzarE1boXan6JB08pZ/gW
 0LeVMeBqtvn14cZ0sUfeU12m2qA9yLiWZcdmI+K9ZFdyBobjvJIDUrbqVv7vQJpfwTA5MYv7E5H
 3NDHWF9prDXRx13fg7Gjg/uQoD2NB0Fbpr/I6THtOmPt2+boU98yo1IP0H34tY+UtuI4YZ5TD41
 s7K6Rfg6H4cd1WcOstOeRnBKqGmeZZQm2WZ0DerCZnZeApBXgOmfTzwNSlbOEV/GZ2RpeRmrM7C
 epAcQ/PaxjE6MFJ33QHBX2Z9z85W1vVS4yp6j3BS+1OGaxU2TPUF82EZjez0WtTMhLezHSCusVm
 VcFGkpZUXxW2Jz9K7spZG+yv2fIugoZvBmsceWs/nyKzaXjFYWwifAFf0mJujxzdgL3OoR6eVdx
 h4K4V7fEeUudlFeYdjIHrS8Bz6WfFHNchCPdWROk801+7iJxXbb7pIUSDzgVdmBuKumtsuk4Kir
 YM5BaTEeEgv/VEg812aAxbnAch3jR3JT5nk8F5VyPvSNRpgwS5LphfwB1QoPQFR+lKIRyDNkUmf
 M8RTmo8FU1ehL5Q==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12396-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Queue-Id: 622A136BF87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 17:36:53 +0100, Thomas Weißschuh <linux@weissschuh.net> wrote:
> Some upcoming changes to the readelf invocation would create a
> very long line otherwise.

(I get confused frequently if commit description is not self-contained
but only completing the subject.)

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


