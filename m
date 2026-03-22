Return-Path: <linux-kbuild+bounces-12127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPzzCjDmv2nh/AMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12127-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 13:53:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D502E9519
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 13:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 716FD3004219
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 12:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EEDCA6B;
	Sun, 22 Mar 2026 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilpcCUl3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B187F4414
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Mar 2026 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774183862; cv=pass; b=ND7bsLXTT4xHjJwz4SxeUPljtU1RhE2x6fNAft3dsXNcSPsM7BPvOI0VAMZxut5I60OF/Vc6uQO4Q/42wpR7ZiCN8CmdoVGBibjf6BtVEsSyFYFaocZk6fh53VJoDbdQ+du6CMvGKNHwk9jizkoGOBwCjZKcWj4c5LRqqIIDMdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774183862; c=relaxed/simple;
	bh=aHfGFbP1HvWC9cpLHGpZTxMk3l6xRMeWbKHpxTTPO3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ltbhifriv9IunDCqEffcZOTR8KZXlqyapo53Y9N4tnjOsZRAPxq5WZmydhhsy/1Xv1H+vTODItEwKcT+SUsvK+rGR45HEXCnKVw3V+B3AFU8W6zkksROaof2NTa44AZPIiSE6z4pCrJ6IGJv6DBryhCkmUK4HiuIYZjxeBTyNAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilpcCUl3; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so3481885d50.1
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Mar 2026 05:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774183861; cv=none;
        d=google.com; s=arc-20240605;
        b=IgFWx1mIAa3H0kNUWwrF24LPMteySVBPJqckpaWrsUhkfNuiHznJ+qzdEWey2cTqPs
         1BxPgGqpa+H39kA6qkw7LJgHbsfad3nlww1knc1qZQvpokMpzSJbD8wsjCpQHoHX1wVt
         jQeKmxC77O1c1pVWWeO2EHEr0SjCkyEVLeNUmlKIt+c71E1jQIrAIQUr6PeoH+R+OVvV
         vDfCL2A89v3ux77F4voAy8lTmOlHK8l6TWQ+KhijO7YqlSdygQ+t2DWXEDEHXkd1PjyZ
         73ZrGZlespfmSM74FqfqkTYFy/gigEO4Mdwc7TTLpWKXn/LZ+aLoi9+7adDEuXmQo2Ux
         YJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aHfGFbP1HvWC9cpLHGpZTxMk3l6xRMeWbKHpxTTPO3I=;
        fh=cukueT93kb4EqAQh/m43SQq1ALgp3Y770FMXB+Y7kOs=;
        b=Pi/RxWQBa0shXTru5Qiquk5Bmw2V6Fyxn56+iJXRUIQPPTr8T0+jS5LYZwLVrW8rVo
         zPogyqYTSGdJ3OtuQi9xweFgy3g233ljq18z5GH79tgt/d3lEQHyY5/swwkDiNiQop0Y
         cYYxHyY+GIflQ0QDZ4GtqcnRrmChKtXd/j0eXgGAlX+SwFan7Hb9H9vgvw9/JT99dFv8
         4JLG+B9kaCIY+mGxpG6cP04SgNpiQMKpNZaKhRjkrpj7aOQEqICFxt3wC1AXlzdIy2B2
         C9x7igUDXxs9ZixV8KpNV9Kl3e7iFZM9B/Wbk4lUaJmvDvOk0RedUzn/SUd5xdQsFMEM
         Lilg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774183861; x=1774788661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHfGFbP1HvWC9cpLHGpZTxMk3l6xRMeWbKHpxTTPO3I=;
        b=ilpcCUl3Ha0uuIsdeYhp10YVmrfTpek8DlHuaf20nYcII4315ZyABidg++/wpH94xL
         KNQYCcxQxVt0oAOV562IDMpcv01aqjVearHptAm3lGGT6uTSqDT91z21TlFCkLSQlyZE
         RXd/WlDw/WI9ksTj6A4LRT5IJjUiVSVy7Kwk/An/dBiTol/Bzte/BUaC9aQ4zAIil+n9
         gORims9ygX6jy8DSd8roBWmjd/G1cwCuANvnZPqb4wLRkX/NrhCFhImj8GZ76i3k6zH5
         a3Qksurzn79YO7+mm5m21/qdmcPM2XpMZFWxRu8lWnHzjUIwGA5CywwDSwxQG3Iwsova
         Mjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774183861; x=1774788661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aHfGFbP1HvWC9cpLHGpZTxMk3l6xRMeWbKHpxTTPO3I=;
        b=PJ2MxbiH04kdmnLGBPS69pxObbbEIrsyzGBwIOrtA8jMIqZ4Vg4QqxrSGoE3OJRThy
         /a83Yoft8E4NYPfKYotGnOJzqzLBO96ljsTVY1zRoCVxQaP9lxTa0HfvOC8+Eo2u2mVr
         wsC8DNBLfDMDGUm60aJ5rNe4Gsm5mdIPF7Xdp7gNnUqC6xBsBN0VjvzLWTIrTFrHWIzz
         ahOKe+/tlNwW3l8XnJrY3oBjxBii4xjCjz2yJNBO7pN+RM83tVUc0mfQGQZz6gJ0RlrY
         iDQ4GVRPTi3ffKIN+1HDz6osIKXZgOLjj3dxMh6YPnsGX3lxeGgnhYvjB2gKHNRQ73pr
         JhFQ==
X-Gm-Message-State: AOJu0YyWIFfGOerCJZrfUBxWQHZeZGY6Z1/dYn5BqHjuAHJDhJZEwoDd
	GuGPGjlmBO8wCNqwA6uyBbK4w5MjXbkXAxlaNnE1kVVla6U4DrUPf7y6KJkmdIhGbByjPItDwVM
	RtApZa+0A9rICEsz0s2LpzM10bYXySeEthA==
X-Gm-Gg: ATEYQzxiNKsA9hu94/jw2Y5EyqibQjBS6+foBwkzdqqgEgPylGiSrnUpy1Djw1SoolE
	EbVP+Kob+vjfeKG9gMQUoriHgOe4jGuVBcBhrPkRttckos0bQsnH8S2I3DXtDOeSx/2+HKnN6Tn
	1xjcqyN0Q4fm2cx6QHX5LFOHlxnxbUDlbDeU3mV4THJ+jtJyD3fItwBR6Lb1k+4FOreJEYvU78g
	GdIqs0aHXDZIRB8UZjpCUEOKKkQFKhJ0fk6Epryfj+T7hTymbDXHgDlP41HgXXdK9itKW8G1zrD
	Q9hszqu2aCvkW2rC1Q==
X-Received: by 2002:a05:690c:1d:b0:79a:8fa0:85f9 with SMTP id
 00721157ae682-79a90c54523mr91531937b3.61.1774183860677; Sun, 22 Mar 2026
 05:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
 <20260310014912.3023668-1-safinaskar@gmail.com> <aa-5IhUnf4CBKOuN@derry.ads.avm.de>
In-Reply-To: <aa-5IhUnf4CBKOuN@derry.ads.avm.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 22 Mar 2026 15:50:24 +0300
X-Gm-Features: AaiRm53_Y6x108qyspvhmQvjDcaoHm1bC4DQaXewPaLam8d7VVhw8IYwdRTDSNM
Message-ID: <CAPnZJGBkFcqLML0MG9_wc5Tp4508HZSRhBQV2ukhBd2wxaGshg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12127-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81D502E9519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:15=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wr=
ote:
> Therefore I chose to add the comment to usr/.gitignore to prevent
> accidental removal of the '/gen_init_cpio' before the time has come.
>
> Does that match for you?

Yes


--=20
Askar Safin

