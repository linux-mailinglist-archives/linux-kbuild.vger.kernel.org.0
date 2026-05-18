Return-Path: <linux-kbuild+bounces-13258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGB5FUpbC2oCGAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13258-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 20:32:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A649A5724B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 20:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40605303DD3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 18:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53263806D6;
	Mon, 18 May 2026 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nL+HNbQT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4A38657A
	for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128384; cv=none; b=ShtqLX36Tsv9+1KF+Xv/HlJB/WZ9y6PUKElBbzF86IX1GWkfsKhI54S1bxF2aAkra1MWHwXr/j4e/zVcVJSwIBe++iWayVizjfwNuFWhGZfvsjP2lChSd0OoppLB+zrtG1IOZJu+cJKoGpon5k9UXxX78Oikmki37KXRRSBZwsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128384; c=relaxed/simple;
	bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCOZnBp91eUok73IIZvdMPQh7rdJFvHDFr8YzjtytTMuTxxbVP8ulLML05nLIzr9q+laHmJMXmuj9w5PnGTSvEVxH6ULRmMCzpco1ZBOjJmjpsobOuMsnFxtfs2RlKyfK6slLt7A/8crBAK7PVKaKHxGZhOBK0PXgrT3nd4xOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nL+HNbQT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44e5624c053so1562196f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128381; x=1779733181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
        b=nL+HNbQTZ5Yn0Xoa60Gk2Cgr9XqqZwlFFkJM+ShxdK11YEOMUNL0vcd9tzFug5sWKz
         2cbOBz/prx6kJcgFYNBM1FLljWds9tb4vqxxFQMTYB7MD75k+H4JbVE0unI9JYs17B8I
         EiSZrfi1IGvRX+Up7LSwDpfC31FpyEecWBmPHViLUB/QB8EeyVzI1iRlxu0TKWHXMAvf
         MTfMOXVygd8oyFybXQGKl+J9N7Ey7+3UM3SCoI1Ff8MeePJPZp8urv5Lz4hTIkj7Z2wB
         WfIjcPTevk8T3N+DhUH1nZzMGPQdBRHwRhoQJZh0Bt6czDbd/hwd8E8bRRncfQBgKJDK
         p83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128381; x=1779733181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
        b=d7GSmPlO2weTGA/FYb4x5YJ3xDLM5znKcap9MakXWh45ZQ2V3SWM3thYPie3r+kTF7
         75phxubHdu4uwr6350iiNdRdol+8t0nQV8TpM2aVHGDYs/+5jkFx3kD1xh6jvtBKMCB3
         cM4/QlDAdYVTVeCUDZnN2Qd4Wc3XICpOzpI+I3GV+24UxUt6w1VMnlbtciiW3K2vwWjT
         fYI1XhtamN5YUPIKOhtN+LP6cdhj+3fTq7gtxwZ+YTwERQFX9GEMYLXlJxvhKfg6XOzx
         q767pIXaD8pj1OBojoQhkKMbEdmd7jygxhhmckmuKiIcQAJ+tHDlMwTpeZ8prmnCJfsZ
         gOOA==
X-Forwarded-Encrypted: i=1; AFNElJ+wGquaERPUnl/WmzQ1IPxpFtEpOcLSMFDLt+84nThYjJ93m29EBbF1tQKxEO/URxwwVIfHw7ww4tGUy5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUfx0qAhI5R4B9r/huprKMnmuiykEaCSLqOqbUerjQed+aUW3
	lpqRr2YqjGRcjaf2IUWi0+kZqozYHu2hdJgP9xiI+6oWfwbtgzl5rQvF
X-Gm-Gg: Acq92OEWfwFKubFZ4ZLLft5ULvscFVaL6PTmdAKE+JP49immsvnWvFi2U1+iWyEozFh
	AGQhuPnH5zkcUX/cpNH/BafmIRQTjiB6F9zjmUX+03N5PQyCHCDdgkNsOcK43Ib1fTMDx/FK1BX
	Rkr1LHZGLiEI8X83IsVFQKaAoACxDoSI2ZkLvOfSa2ou+8eFeYkT1LsAXUCqPr9//6ms62A3x8K
	WodmS8v5+u4qpzkJlUwM9xpgCwGu/YBqruyEivOHp8yfRo52juJDEjx4SNn7D1zLVFceRscR4hv
	QT5rIyxzAK9PE7XEQBqwU+J0qUZQNJsYRzsjehinM6LSAZ3ty9DEugHJk+hNDtR9V18Kg4z2Q8S
	CbMICf3IyhLmZ7E28xtz+4Y1cs2LK62yT6I+CaPDE/Dpeu/c6cOa1s1FsHZwqis88iO8fqdxLjc
	K2mkT90+/mAuZmc7a5158GJBV//8P9SEQNG/iSyozqzz4XLeV0cDc3ShbF084=
X-Received: by 2002:a05:6000:2489:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45e5c58fe72mr24859160f8f.4.1779128381341;
        Mon, 18 May 2026 11:19:41 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm38425105f8f.30.2026.05.18.11.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:19:40 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8294a089-4350-4013-a644-b7cb4ffa5130@gmail.com>
Date: Mon, 18 May 2026 19:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 ljs@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, qingfang.deng@linux.dev,
 yann.prono@telecomnancy.net, ej@inai.de, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
 <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
 <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
 <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
 <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13258-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arndb.de,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,telecomnancy.net:email]
X-Rspamd-Queue-Id: A649A5724B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 09:08, Arnd Bergmann wrote:
> What about dependencies that are normally shipped by the distros
> along with the rust compiler? Would it be possible to allow a
> range of version that matches the ones that are present on
> common distros like we do with C libraries, or would that cause
> more problems than it solves?

Hi Arnd,

Yes it's something that I would like to enable, though we first need
to wait for all of kconfirm's dependencies to be available for these
distributions.

I've filed a GitHub issue for this in the repo of 'nom-kconfig':
https://github.com/Mcdostone/nom-kconfig/issues/149#issuecomment-4480419622

Also note that the author of that library is CC'd on these emails:
Yann Prono <yann.prono@telecomnancy.net>

I will need to do some testing once all is available, but as far as I
can tell, this would not create many additional problems, though we
would still need to provide crates.io as a source for distributions that
do not package Rust libraries.

- Julian Braha

