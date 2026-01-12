Return-Path: <linux-kbuild+bounces-10535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB93D15AF4
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 23:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17B66302C20E
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 22:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E942296BB7;
	Mon, 12 Jan 2026 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHu7FvY0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF9270EC1;
	Mon, 12 Jan 2026 22:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258392; cv=none; b=PFxlGEgI16duqU2EqXbdFtsHdOPNyKe+Qnd40w5QQRvMPNsz8aOEry/uT5XW4KT85MkE52xeelnS7coLNlGfeYOSczBytVcbnPMtKiwdtAHAGJQim95b2TK8rMA711zGyp66o/MFo+9w5jHXZ2KaKAdQASjCDGxeWC19D5CyUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258392; c=relaxed/simple;
	bh=tjydLnqjMw8FmyuO1L3aZRXJhGPhGJxCd9JUJs958yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXK61gL2tDXA4LBQy/esRGI3QQjLpYxrS7DR85eZgexv184s1FJx5PWoYm95zBpHK+/rogmUso5PALPA7Tbhtxkl2sdS0vPqpIcXXeEIusXR5ucRypUp5gUcbetN9AbCgFYbmN+XvptC/IsSTSoYyNKscmR283DiD5MwNc7qzno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHu7FvY0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA825C116D0;
	Mon, 12 Jan 2026 22:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768258391;
	bh=tjydLnqjMw8FmyuO1L3aZRXJhGPhGJxCd9JUJs958yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHu7FvY01U+TRxIOwmD3fVx6/u6P/UrtUFVIYWSS9ulGOagjv0iXZvM8eHmDjWzh4
	 kkdydIQ+aO2ZO4zwH3PZMfADR899NTePEI0UEFHUTDoUxWuARGp9hCdDpSTFUuSgvw
	 OWmddPC0fWecK7KCUQH/edDjYvlQCOUNeeP+8sv9tjkoeGUKCL4WEM1jxIrEvwFf5K
	 ZqO7Rn3CQjmUp4znfccCzmu6Q0Rkpw967hQyC3tAa8H97j90mTTPQm2xSfzaTkrF52
	 ZAE8A90+LN/ZI7oPpturqW0omPYRhnDCqFgXGIpSPbJyTKw9c81OYO9vXB/P+xWygd
	 emDCaM1MZ2axA==
Date: Mon, 12 Jan 2026 15:53:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: uapi: Avoid testing certain headers on ARCH=arm
 with CC=clang
Message-ID: <20260112225307.GA2241363@ax162>
References: <20260110-uapi-test-disable-headers-arm-clang-unaligned-access-v1-1-b7b0fa541daa@kernel.org>
 <29b2e736-d462-45b7-a0a9-85f8d8a3de56@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29b2e736-d462-45b7-a0a9-85f8d8a3de56@app.fastmail.com>

On Sun, Jan 11, 2026 at 11:29:31AM +0100, Arnd Bergmann wrote:
> On Sun, Jan 11, 2026, at 01:52, Nathan Chancellor wrote:
> >
> > To keep the build working while the root cause of the warnings is
> > investigated and resolved, disable testing these header files for
> > ARCH=arm when building with clang. 
> 
> I think we can just safely mark the internal unions as __packed as
> well. The (untested) change below would annotate all of them
> as being potentially misaligned so they can be stored at an
> odd start offset, and correctly produce warnings when someone
> takes the address of a member.

Yeah, this diff appears to avoid those warnings in my testing. Would you
want to send these changes as formal patches so we can get formal acks
from the maintainers of these files to take them via the kbuild tree
with Thomas's UAPI testing changes?

> diff --git a/include/uapi/linux/hyperv.h b/include/uapi/linux/hyperv.h
> index aaa502a7bff4..02ea5f2e43d4 100644
> --- a/include/uapi/linux/hyperv.h
> +++ b/include/uapi/linux/hyperv.h
> @@ -362,7 +362,7 @@ struct hv_kvp_exchg_msg_value {
>                 __u8 value[HV_KVP_EXCHANGE_MAX_VALUE_SIZE];
>                 __u32 value_u32;
>                 __u64 value_u64;
> -       };
> +       } __packed;
>  } __attribute__((packed));
>  
>  struct hv_kvp_msg_enumerate {
> diff --git a/include/uapi/linux/vbox_vmmdev_types.h b/include/uapi/linux/vbox_vmmdev_types.h
> index 6073858d52a2..15ccfb5d624c 100644
> --- a/include/uapi/linux/vbox_vmmdev_types.h
> +++ b/include/uapi/linux/vbox_vmmdev_types.h
> @@ -229,14 +229,14 @@ struct vmmdev_hgcm_function_parameter32 {
>                                 __u32 phys_addr;
>                                 __u32 linear_addr;
>                         } u;
> -               } pointer;
> +               } __packed pointer;
>                 struct {
>                         /** Size of the buffer described by the page list. */
>                         __u32 size;
>                         /** Relative to the request header. */
>                         __u32 offset;
> -               } page_list;
> -       } u;
> +               } __packed page_list;
> +       } __packed u;
>  } __packed;
>  VMMDEV_ASSERT_SIZE(vmmdev_hgcm_function_parameter32, 4 + 8);
>  
> @@ -251,14 +251,14 @@ struct vmmdev_hgcm_function_parameter64 {
>                         union {
>                                 __u64 phys_addr;
>                                 __u64 linear_addr;
> -                       } u;
> +                       } __packed u;
>                 } __packed pointer;
>                 struct {
>                         /** Size of the buffer described by the page list. */
>                         __u32 size;
>                         /** Relative to the request header. */
>                         __u32 offset;
> -               } page_list;
> +               } __packed page_list;
>         } __packed u;
>  } __packed;
>  VMMDEV_ASSERT_SIZE(vmmdev_hgcm_function_parameter64, 4 + 12);

