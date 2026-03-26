Return-Path: <linux-kbuild+bounces-12307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPsjDaemxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12307-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:35:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3D33BF66
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AFB5305A896
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B7B3A7840;
	Thu, 26 Mar 2026 21:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kho7DaWs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30DA3A6B86
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560722; cv=pass; b=BwOx2dVa1JaiSuZu5fB1GwPmukwmVMGR3oACxRSCpz0N/BM7cNUxWChRVAy3LpCOZ0IRE9fxQmgDzX1+3oQp4Aso97HYyO7N2y7S5KGFoDw+UazLhZ04m6FY/fB9krv0mfab58X5vAyMETcYtKMgT8u3FnipFf9Ob9oK/qkK3E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560722; c=relaxed/simple;
	bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UctKoc4NpwSCBM0zz+zldJhvVQpjFAyHodEVMNdnYD2eU819Ovj+pk7P6JIDV1svQy+yk/exdlMyLhshESlM6yfxnPUm0s73QULcKUul19MjfhF+Kf4KDkILcE0aeZ4aEM/RxertgDkAdMW4ZlTdmvT5uuZ7pgRU6KXDgMVGx+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kho7DaWs; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a40fb9890so15804987b3.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774560720; cv=none;
        d=google.com; s=arc-20240605;
        b=XmHK0U7N9WuVSGbReIglGWrOH2bdGBsF6gi9RdCuOtOoUdnzHNG+g2Wv5CvVcQtkdK
         68aLc9BgVyUJWXbkznh8O4fvyZCGb/Rr2CiJR/8ORY2NG22pe0ODOb20yTazIqIJ6paY
         YAC89hNEcyCnvPcZxHk0ctg9u+w33smGP0j1BWS/k3TkQG3lvBeW5nLfHN3HYjSpcDvT
         t/p4/G9+n/s4OW9iYFzW0aIaBkvtTMHew0cRgBOde6iSIxyn9mlbcJEXC+ZC8cFk7Omr
         GUHJs/IdCONA1BG8u+jHuUF4VsxELuHh74SZvN/CsISmjey7v5uu10S96003PXu9L0rg
         FpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
        fh=8prM0SDULHi6atF4776AUDGfeyW4ZJPfvb4RuyTr3oI=;
        b=d/gcPLX0vqXK/oIOuACOlmHcGiAwXXT926t6dPeo5zLew9kMDn3AXoQyatJgi+yeiH
         PWWNPqefpJK/oOEwk49oClk6rF+LHGruvAT+BRnXR5QdbOwafym+jtQNKVFuzP4Z4HPm
         CQx08TIQwJHArUx0nadWSGvtkZktetCCWMvq8SRtHvk3+pKYP9EQxJUQbPgf5o73l2cl
         Tlmt9j4zhDd9rxkP8Zp1P1OHH87NZhFOVFPiplK0S0QYZZVLNja+8P+f7KXNxFGcqftn
         lys/ax6U2o0qskktp64/Ql9KXYmj1qgeLeRTTn0+IrR2f/ZUt67Mp5fQQiBQz5qJGlPO
         QpbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560720; x=1775165520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
        b=Kho7DaWsIEK9g/9BJfiXPxDaRWvRSlr9ewjSWhZ3/2jVk7CTpXsD+LMoESL1iui1KP
         AizCuJYgmL+z5WuW900A2ZDSNB24rn3OMknbhvTvkaeEnfpew564K9JouS/ubzDclFcb
         u4h9L3i56FhJQIdnr7oX9QRGOjCj6pINHt9s4Ll4B7MQLLbD6vT1iSz2ui0En3rmrSNV
         xM6JSKvn07/GFG0caP4tW+mUgCMgeCRPWkYnxIsWIA7Q3a+DsGLoeE2e2nA0nOUIVh4T
         wk7nU+5HATu2tS1HYl9MtrIoSioadmZB30NV9ZfZDB7hjer2F2X99FQrTVBasg7zfz5K
         8SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560720; x=1775165520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZyAuJdbm5lNyLHWtj8JZifMocqSIEE/M15yyD9cWUw=;
        b=Yy2hduSMaM3GlK/d9SSBFT4bH6JM/yXe7x1vqC16dN0fhTkCGoBM9iAnvy9gAEEf9g
         4tiDcJUC9KL2NKHBR/0EfvArO/Xnh5JwnMHxZTZLTR0aRuwfUCIAshhVXwHbXvJdrMwI
         ejceMVy5+NaKwjXM47h3BKf56NHPDPt2xAhRyTHf1Yz3KC0Nkp6ovzqGArzYn9DAUBhe
         CpXUHRNveDCfoH0Q24wLNCvMwf5oQJstwq+cWrZNojJ24FTPDY7chavXSXfMjqOZ//zB
         /SEk70ZLr/X6ORmCO5YlkWoi3/jHsCTetoUoYzjMg6KhOVfWbimk9ElCiG4tY3qdkNpp
         Q/fg==
X-Forwarded-Encrypted: i=1; AJvYcCXpqABNUusIphy29u0GXc4nGkupr3xlyR4TfRWg+8m5uFc3hHjEvjiRUmE9f5iiE9O5qPwWhGHTgLWOGbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVG5KwgMbdsSM5RlE3hgCgZJZHWpV6agwymgjsuYClnlBZano
	w/ZhkQzic0lKYIjpE29BvTXBLv4y/yPY99fyc/pe72JKbTg2qc9I/rC9g0+wQwwGI04WLH6hhAI
	ytVp7pUH3K5TbAXq8c7rmT3voXw/i3wcQikFEZvqc
X-Gm-Gg: ATEYQzyAclUE4ILHVjrwL9Cttp+fmHnWjQ2tT+SIfCxN7HR5TdlN/j4pNZlnX4varGY
	Sw7tbbBzm6j7yOx40HddjBRuS5kTWqqyQQD/I0lhBs2K3pU6yg0ucjCv9m741cDnph1dKznPtTb
	C9zmsEj8YUapZmVrwDuqH+v2awBTShrbxamG3v7SkJBP4/8KNaHeFWM7OA2W6e/Rbs6hFr09ket
	G4bQ7NTQdeBCxh3MIlOdM0m3+lY+5vC6n8Fe1KT4U2OJNYYoYr1JHlUQe5IRMsrFw8P0V2+TJho
	y6inL5rE
X-Received: by 2002:a05:690c:368f:b0:79a:b409:b62c with SMTP id
 00721157ae682-79acf39ca9fmr101703267b3.22.1774560719217; Thu, 26 Mar 2026
 14:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com> <b83c9524-13df-47dd-a597-bebab93288d8@suse.com>
In-Reply-To: <b83c9524-13df-47dd-a597-bebab93288d8@suse.com>
From: Sid Nayyar <sidnayyar@google.com>
Date: Thu, 26 Mar 2026 21:31:45 +0000
X-Gm-Features: AQROBzDfMgZ3xEPPX-07HtZ6qMri8pHd4_VLlgIvmfka8IMZId9kQN4ffSRsYhc
Message-ID: <CA+OvW8butx7OD5ArjWXm7osCf4tV2O-suNHcHj4gFaQfMMPjwQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] scalable symbol flags with __kflagstab
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, maennich@google.com, gprocida@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12307-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97A3D33BF66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:49=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 3/5/26 5:55 PM, Siddharth Nayyar wrote:
> > This patch series implements a mechanism for scalable exported symbol
> > flags using a separate section called __kflagstab. The series introduce=
s
> > __kflagstab support, removes *_gpl sections in favor of a GPL flag,
> > simplifies symbol resolution during module loading.
>
> I noticed that the series has a bisecting issue. The module loader
> doesn't see any GPL-only exports after patch #4. I think you'll need to
> squash patches #4 and #5 to fix this. Alternatively, the patches could
> be swapped, with the caveat that GPL-only symbols would lose their GPL
> property for one commit.
>
> Nit: Please use simply the "module" prefix in commit subjects:
>
> #1: module: define ksym_flags enumeration to represent kernel symbol flag=
s
> #2: module: add kflagstab section to vmlinux and modules
> #4: module: use kflagstab instead of *_gpl sections
> #6: module: deprecate usage of *_gpl sections
> #7: module: remove *_gpl sections from vmlinux and modules
>
> The changes look otherwise ok to me. With the above fixed, feel free to
> add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks a lot for the review. I incorporated the suggested changes and
sent the revised patch series for review.

Regards,
Siddharth Nayyar

