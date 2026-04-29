Return-Path: <linux-kbuild+bounces-12933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCL+E0U18mmxowEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12933-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 18:43:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE766497C76
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 18:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A00230115B2
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 16:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4B13B961D;
	Wed, 29 Apr 2026 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z6XPu6rp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887E382F1D
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2026 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777481021; cv=pass; b=o11jptb+NsxOQslE7yFojDnxXgreeXQuBxpsdZYtFO6fM2NhTMP3qKRw/AjXUDgB99aBbt+RHY+EgWlGMeIpZxf0/hSydnKCeYBeM/aBcFto0nLMQyXyQY86yfP4FFPQeJmHtDuHfWee0m9VtfHJ4YPPVFKMldYhjbg8Ro5fjaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777481021; c=relaxed/simple;
	bh=MqSqhGjtNDbnEb2QTBR92Es5KtPX+3lXEjPCy9wPhoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdYXI77SoXyLuGyJccQyEO8CUyglOxZG/weJzhuRBliaawm+QGN+Dni/vNXkwLZT2mSb/9HHkBRKjCKQLsHZRrxjwKLUpthP44tJcwr05asOoFHAWhNQvGU7ubdzaCMzBAWKERgkVtAdbMalMUM6sOQZp1FRhAoSLgiYS3dor30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z6XPu6rp; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d864c23bdso806851cf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2026 09:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777481019; cv=none;
        d=google.com; s=arc-20240605;
        b=Fw5q3VmmlKf/Hf1g7+X2wz3LZtWuB2VhEgzm7lMC2ytnZYDFRMTI1wVCWh18Opfu2u
         y1fkOSsTZMviyk+9+P2XRI2ZxvxaPCyUnPifvFKmTWRyJApNgk5aC7Qlda1O8em0yJKX
         gAse2KValTQyzfX8Id8KXjlfkK110Gt1fVUxGS6/uuSzOVXsxDrNVYU9XywSZz0CwDDD
         NwUdVBWgKZcjvsVaibF7U/HztaZcPh8RVBDZuz6OkWdvZ6/gmBZiIdgN2pP6+Im3lNgn
         7DhM93ty6MwRQ8XqeLVCPtSYPY851RHJc5+LsDeYNJvg3r9qS+Ca8MqdP+sq76FX+NNK
         d73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imZEw5SCLY9qEQ69oWbenh4ppLOBEqp0hlK19phWzpc=;
        fh=of7Qma3/cqSxBmPbVHU4nROPJgH0rsKx0uglYteFmTo=;
        b=ChaH2dNH0dDiYFFAHQqv7myLu5HAHQ3J40E6RwMXw2Vb2na/2Pe9yGH0FyXdygpc+O
         fULsOSQQFU4BFd3dma6/0EMTwQsVEj7o9wc6Ch+k85Lqg+A4X6u8mmrwL4NxbEYpFJY4
         4OR/rU8kc5zTUjCDK9gou2a1X7e2LeqmlSXjWR4G1/IGEMK44HbJY6EMh3m+OJNu/kio
         yLqo7dcb+G1xFSFkDg9T/xm0Ux8iO/mCaUk2j7u/aCx9Mp3Ez6XnNlFTj7D6+rCzZA7K
         CmPEeGAPr9FeReq7eFMjj/AzTNEk4KFJdLwOw33og8KFLF6FiADcau/0r3E1jIJP21vQ
         JAmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777481019; x=1778085819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imZEw5SCLY9qEQ69oWbenh4ppLOBEqp0hlK19phWzpc=;
        b=Z6XPu6rpkEKRzvJxn99dlqvnt2uE8V4iDCHr9VrgKifkNBfDU6RoDm4ZVAC2xQsVk7
         rzeJwIlhVje96cN2+qAT0uDadXADykT3COvJJYr5R5CJB4Yv9gP/2zrpwR0YhcQ4+/Qi
         UfxlVy6n3N6FFzOvb5qweFE6JDL5RIXebJIe3NkpkunHeg/Kwf0IsYcXmbAkhFfpURw2
         Nqx2zQQo64sNxxYB1WeKZArShSBT1mJPXGE3bLkGKcD2UtX7EoJpBVwEx/X6kuiu0/g0
         bywjxEV+f0yAW+BD2LvA2O5jnD/G1RoU7bktd0/MbGgV9QF2eG8RbrqSfgIoo4geWopT
         69eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777481019; x=1778085819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imZEw5SCLY9qEQ69oWbenh4ppLOBEqp0hlK19phWzpc=;
        b=en+3hl/zE+8JLbQErPBhoLxbs+2GGoDRmnKm+0G5O5JvaTDMH6WPUd6t1LHH275jkZ
         rd+GvKjGmaPD1qePOiz0vbbwojqv6LRFrcRpHQ1ksEI1DqdM75uJfIJ26MSbVIhloOfa
         KpqgBPfa7XvEWg2kH/+SWBsoO98T22QNWemS9p8LG5Vi7DhERKy5ctwKsEMoUGQUZ6km
         9yy+GfsyVwi0/dS84il7jos4xTFMSqf2yJFqns2+qHGpohWtuMv4JuFL7MQfTQpyb8GB
         H7oNaQL9tOW78ZD2Q6j08gY8e/O0fVDDPO4HDPyG0/HiqqgDPABkGGi2tWo6MFT1v867
         sG6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8wTWIawcgZgWoTd0VwLSj3VHSiJAJQ91b3LS8jPPFr7jP9eFdNapI7rlzDwZjv2msgHzzsH+jP18vk2yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMjCeS14stDCv9BSdBX8J6V0lL7xSi5roQo1ChisFw17QG/dl
	zzQHT8YdY7MvCuLGjaB4gtAxgBrXU+cnXYif1/jWO6smoof/j61f35VmraIUD4ZFlKGXoo0C5/8
	loTGDKtDWrwqWg9KJymvam05C0C/q/MMeGOLRg2lI
X-Gm-Gg: AeBDiesdBYqIOfvYhlAgez0PjcXvNazj1dF/Or2Iz0G/AzDVFAeKLo6+gd3XzcZ8Cqn
	Og3iWas/7mllPCe/JGiYUKMWVkggUrm+MdwUgl/6u9qVVP2TeKVhg9h0keLMaen7oRAHqReYTNR
	VyGmNGrVNJYf1Uwwzs/4U4EOv9zOu+D+3HlMld7SETvAIfImMsEekJAgz/VWllV6YX3uamCb2kK
	fig+aXasMkVpZ+LQYF8k0cxFcQPOBGCBC+uAEIP0IkH1scB3SKY7LavV27LLpb6yP8/a3daQ3MD
	UOzYR6boHaTqsTbJARgiWLEG3Ys9W6n8cS1KlavIE/MtGJDgA/jSbLP9/JY=
X-Received: by 2002:a05:622a:1b12:b0:50b:8d3c:5bd7 with SMTP id
 d75a77b69052e-5101a60b0aamr15133791cf.9.1777481018705; Wed, 29 Apr 2026
 09:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-6-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-6-81d9b2e8ee75@kernel.org>
From: Rong Xu <xur@google.com>
Date: Wed, 29 Apr 2026 09:43:25 -0700
X-Gm-Features: AVHnY4Ik3LqgaCUyRYx0CryX47pN-vmu9vi1p76k09ZWMtV3tzrvTc04VbRHK4M
Message-ID: <CAF1bQ=Q9bZHBT13K7OzY9-QHHzm7D1ZZ3fM3M+-oVzdU+G4yhA@mail.gmail.com>
Subject: Re: [PATCH 06/14] arch/Kconfig: Remove tautological condition from AUTOFDO_CLANG
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BE766497C76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12933-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

This looks good to me.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Tue, Apr 28, 2026 at 8:00=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the clang version check in
> CONFIG_AUTOFDO_CLANG can be removed because it is always true.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Rong Xu <xur@google.com>
> Cc: Han Shen <shenhan@google.com>
> ---
>  arch/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 0d34bcafecaa..5d6e9f56210b 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -866,7 +866,7 @@ config ARCH_SUPPORTS_AUTOFDO_CLANG
>  config AUTOFDO_CLANG
>         bool "Enable Clang's AutoFDO build (EXPERIMENTAL)"
>         depends on ARCH_SUPPORTS_AUTOFDO_CLANG
> -       depends on CC_IS_CLANG && CLANG_VERSION >=3D 170000
> +       depends on CC_IS_CLANG
>         help
>           This option enables Clang=E2=80=99s AutoFDO build. When
>           an AutoFDO profile is specified in variable
>
> --
> 2.54.0
>

