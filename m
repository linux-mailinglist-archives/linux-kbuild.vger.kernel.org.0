Return-Path: <linux-kbuild+bounces-11441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J0PI2aAn2ldcgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11441-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 00:06:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375619E935
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 00:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8B023026156
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 23:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78CF37472D;
	Wed, 25 Feb 2026 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enakta-com.20230601.gappssmtp.com header.i=@enakta-com.20230601.gappssmtp.com header.b="dJ67xo4I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62037473D
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772060769; cv=pass; b=VMNh+8af+oigaWXFxQGQIcYTTydACqBcO+rdCrlDgc9KOF1qZIl2eGtKOVk72Q6Ui+ruEAfKruvnooySzVt89LyCkSgDhaobZqJK5WTthDPPRATcZ2ThHwqURsz2Rn/dZMN0spmHGzOIe0DX6agOp0fE9ySwnf5/XM9BtUcSDv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772060769; c=relaxed/simple;
	bh=slOEbYemEfCyMn9kbsAqfk2eTY1SotE7lLrt0UcwR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSC/lSjG7uuUolvUgYrlArdnG+fjAiP1PJPwuOZpW1IB+zXyDiMWkpbkPMNfoOgd8m/vsTUtbwISUNCsnCHnPnXqqCuZPopR7RsQ+BFitTSfe3EllkiWWl9vGPwZ4Z59a+bYfuHtDc1PftTHhxxQ7MM0lwhW1XdhP9+3sOZBXu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com; spf=pass smtp.mailfrom=enakta.com; dkim=pass (2048-bit key) header.d=enakta-com.20230601.gappssmtp.com header.i=@enakta-com.20230601.gappssmtp.com header.b=dJ67xo4I; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enakta.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35621aa8c7fso42623a91.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 15:06:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772060768; cv=none;
        d=google.com; s=arc-20240605;
        b=ih8Q2rjBfGN8DArfRtE0wcN+DEoBw2UN/3sjJGXBKOQpemuNmd5TDG4TX4c9wmyxId
         9LD4vUaFTcE2ZTcx5l2AOiJGqiqNpxWZTEk21UbHzwXlGEiLIV9p/O//f27dJSTmFriK
         JsdeBbQt5Q21Yja2o3hZrrrGYCi8RCAm34ZCmV/AlgPOd9GvSQkcxUGQwtnvkUe9Zza9
         IFoNXpEWF/YZvfU2aNU75HRWT90GflHDimNYIHeT4fLxCfaNArIQAaUng7Qk6ooeNCed
         VFo5oFd7abFFeuoESTcqDdgHmE2jp36JHXQJFOsm1/4s2jdAvxwcRKOLKc7OQBL8XIf4
         i2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oR+2sKSuT8g7i9hudQ+Z3EzBJ2PNv6gfLnbNBcE9rM=;
        fh=ZaXQ5g8rsRJJuosXMAgpnAAgKSbjLK68IovcNxjzRmY=;
        b=h2JzIwNtmgGtQP2WNB411+1TWVoh4FhcKywJ6OqwNL764ejw2wOOEf10EogSFz0C1f
         j5Rma/OjXjwjXKqz5v6CcafRNTYzVL9gNGYBnHyyZw1khnRxsWlKqX71Wck25pDv5+zJ
         6ZHESa9+ZbWBAxledzVhLpvOxwIeROh8Qv2rKzvdMP+B5aINLC0LtmM5wuO9HKTMia7B
         1rN1xdpeKKGaTqRAIrR0esq0c6YBYFm0LwrLe0NPbikoWF2B/GV9t7RwsBcNTrvSdpM4
         tHvavnie75y1Zxz57xj9dKc3hjIF7Z53vv3XwYNxpeN8T7iakVPOsA55pSLxaHT56OiV
         fY4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enakta-com.20230601.gappssmtp.com; s=20230601; t=1772060768; x=1772665568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oR+2sKSuT8g7i9hudQ+Z3EzBJ2PNv6gfLnbNBcE9rM=;
        b=dJ67xo4Ix5OXglF8bSKyzDMM9t8Gob1brdzQfbnmYQD+/zTCpTFFDHL+LEDzW4I9hp
         xExrrcWuKQT1sVuUccUXFnh7RKjQLqXuYRE41SRNwbaxAabFJIOJBRNHuCIjIqH3pMDq
         O9u2LuYm+lM1mEH0AoGBg71ew3y/WQegdmdPCutU2FxU2OKvJuiFYIJKzWUUmr7tC5z/
         42osESDVdYN2YtwXATskrV1Ah1qgrwGH6uNwGN2/26dKG6wHBAkLjIyfAzMnucaULNNi
         rjwqqhzVPXV6FLYrnzEV/xKr8mJ3qY8D+UadC4n61KM1SjqB6E4P/JYFOBC3G+GXMLJV
         DU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060768; x=1772665568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1oR+2sKSuT8g7i9hudQ+Z3EzBJ2PNv6gfLnbNBcE9rM=;
        b=xGMYO/EWekiq3AQdUdITwtN5Sw1j+fGoxPmokXz2t4YRoKrUNYR4AT091g/euMIsnn
         YfNc9iHVi2ezebwA3xz7Oy84/uCgCfjqrfzSNU7BZ8kxSE7EOq9YFt5rb3mBgqefXBkd
         PhZ3Cde3NfGOGDVT0saLXOkmYdfC+Zxygf8w/A3THiw19G4VvqWQWkozfOXOtV+In8XM
         aVgy5uXFX+NV+rW301UWaqQuVzMiLdYv+pihDQQHOVtKu51KtvVp/5DCBMoglXKCKmhC
         A4AoNgPJODigftTwBFvoSZ0ezFlrRMoJLQj09rNQychmTCfsvvrnmmT3N8eSpK9Am/nm
         qF4A==
X-Forwarded-Encrypted: i=1; AJvYcCWRYzJpvYkpNg2Wzogkv6qaGJMVAwgKD35hNN186HV+00ydHlYPhgOh7UGvOnioXLrLFqlTqv7ZuhLUPWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8Sxx1IpletGPyL1lLYcGZZRVWdAnB+aRqYtVz5QAYdlafVyi
	YRpNf8f09dsxTTGUztK546qd5QMfECpB5EtUiqK+saePoMmfUjbzDueZFwQ7tAYL7dUW4UJvQMI
	acGHT3JvFvF9ACCGsLMPPuHu04idFu+8lk2yflqgeZA==
X-Gm-Gg: ATEYQzydqfBgoBIFzk4gNdmX7nTKtMp0i6iK/wclcpz9puXsJmcVRpbch9GV26VCayW
	nee4HKzebLghMvKtMxRaCTe3PXGUOAIyRz2UYe7FK/xLkRJXTIRA4Oz2aoh8UxkGegN60DDjVl9
	A6iV3TlsXbdOFh6LFwW1s7hQz80995CVOeWE22zX614qrRgIV2/ZJ7+5A7+g9ehsLpyTNF1Kacz
	GHzzqO3jCFd4tieurHAtETvfk56zkChC3AQmJS6q6VH2sDt4vT976/YYMh42wTCsIvRfaFCSYHv
	kt/ScsV2FKsX7MnOWEUvBsO+Xv+zdCwpcP4+cVHq8Z/7Z85cSpdtlWf8cdwtlsRzmlDS
X-Received: by 2002:a17:90a:fc46:b0:358:ee2d:df2d with SMTP id
 98e67ed59e1d1-35928a916afmr1434473a91.8.1772060767806; Wed, 25 Feb 2026
 15:06:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <2cb12a60-32f1-4656-8a9f-305bd0be069e@infradead.org> <c7fda6fb-5095-4fd5-ad1a-22319bdf0d4b@infradead.org>
In-Reply-To: <c7fda6fb-5095-4fd5-ad1a-22319bdf0d4b@infradead.org>
From: Denis Nuja <dnuja@enakta.com>
Date: Wed, 25 Feb 2026 23:05:56 +0000
X-Gm-Features: AaiRm52kXr0tv3uCvUgiWWAiKPcU3fFLlyvqaZ5yFoGa8Q9BieQpuGf7F-857kM
Message-ID: <CAGk60SEw7xgSLc5+5EhgOnZkC6PTx-N98R94t5jQZ4wZKRVfkg@mail.gmail.com>
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-cifs@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stfrench@microsoft.com, Ned Pyle <ned.pyle@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[enakta-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[enakta.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11441-lists,linux-kbuild=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnuja@enakta.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[enakta-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,infradead.org:email]
X-Rspamd-Queue-Id: 1375619E935
X-Rspamd-Action: no action

This was tested on kernel tree of SLES 15 SP7 running
6.4.0-150700.53.31-default.

Randy could you please confirm what is in your config for :

CONFIG_CIFS
CONFIG_INFINIBAND
CONFIG_INFINIBAND_ADDR_TRANS

in default builds of SUSE (and probably ubuntu i will check) it is :

CONFIG_INFINIBAND_ADDR_TRANS=3Dy
CONFIG_INFINIBAND=3Dm
CONFIG_CIFS=3Dm

Cheers
Denis

On Wed, 25 Feb 2026 at 22:02, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 2/25/26 1:53 PM, Randy Dunlap wrote:
> > Hi,
> >
> > On 2/25/26 8:08 AM, Denis Nuja wrote:
> >> Hi everyone
> >>
> >> CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=3Dm and
> >> CONFIG_INFINIBAND=3Dm, despite all declared dependencies being
> >> satisfied. The option is silently dropped by olddefconfig and
> >> menuconfig refuses to save it, even though menuconfig displays it as
> >> [*] (enabled).
> >>
> >> Kernel version: 6.4.0
> >>
> >> File: fs/smb/client/Kconfig
> >>
> >> Current dependency:
> >>
> >> if CIFS
> >> config CIFS_SMB_DIRECT
> >>     bool "SMB Direct support"
> >>     depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=
=3Dy
> >> && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
> >>
> >> Root cause:
> >>
> >> CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=
=3Dm
> >> and INFINIBAND=3Dm, the left side of the || expression evaluates to:
> >>
> >> CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS
> >> =3D m && m && y =3D m
> >
> > Where do you get the last "y =3D m" part?
> >
> > xconfig says: (This is 7.0-rc1. Guess I'll check 6.4.0 also.)
> >
> > Prompt: SMB Direct support
> > Depends on: NETWORK_FILESYSTEMS [=3Dy] && CIFS [=3Dm] && (CIFS [=3Dm]=
=3Dm [=3Dm] && INFINIBAND [=3Dm] && INFINIBAND_ADDR_TRANS [=3Dy] || CIFS [=
=3Dm]=3Dy [=3Dy] && INFINIBAND [=3Dm]=3Dy [=3Dy] && INFINIBAND_ADDR_TRANS [=
=3Dy])
> >
> > so my .config has:
> > CONFIG_CIFS=3Dm
> > CONFIG_CIFS_STATS2=3Dy
> > CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> > # CONFIG_CIFS_UPCALL is not set
> > # CONFIG_CIFS_XATTR is not set
> > CONFIG_CIFS_DEBUG=3Dy
> > # CONFIG_CIFS_DEBUG2 is not set
> > # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> > # CONFIG_CIFS_DFS_UPCALL is not set
> > # CONFIG_CIFS_SWN_UPCALL is not set
> > CONFIG_CIFS_SMB_DIRECT=3Dy
> > # CONFIG_CIFS_COMPRESSION is not set
> >
> > Working in 7.0-rc1.
> > What am I missing?
> >
> >
> >> The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
> >> Kconfig engine coerces m to n and silently drops the option. The right
> >> side of the || requires CIFS=3Dy && INFINIBAND=3Dy which forces both t=
o be
> >> built-in =E2=80=94 an unnecessarily restrictive requirement.
> >>
> >> Additionally, the CIFS=3Dm/y conditions inside the depends on are
> >> redundant since the option is already inside an if CIFS block, which
> >> handles that guard.
> >>
> >> Observed behaviour:
> >>
> >> menuconfig shows [*] SMB Direct support (appears enabled)
> >> Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=3Dy to .c=
onfig
> >> olddefconfig emits warning: override: reassigning to symbol
> >> CIFS_SMB_DIRECT and drops it
> >> scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect
> >>
> >> Proposed fix:
> >>
> >> Since the option is inside if CIFS, the CIFS=3Dm/y conditions are
> >> redundant. The dependency should simply be:
> >>
> >> - depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=
=3Dy
> >> && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
> >> + depends on INFINIBAND && INFINIBAND_ADDR_TRANS
> >>
> >> This correctly expresses the intent (RDMA stack must be present)
> >> without the tristate/bool coercion problem, and is consistent with how
> >> the surrounding if CIFS block already guards the option.
> >>
> >> The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
> >> identical pattern:
> >>
> >> depends on CIFS=3Dm && FSCACHE || CIFS=3Dy && FSCACHE=3Dy
> >>
> >> which should also be simplified to:
> >>
> >> depends on FSCACHE
> >>
> >> To reproduce:
> >>
> >> # Start with a config where CONFIG_CIFS=3Dm, CONFIG_INFINIBAND=3Dm
> >> scripts/config --enable CONFIG_CIFS_SMB_DIRECT
> >> make olddefconfig
> >> grep SMBDIRECT .config   # empty =E2=80=94 option was dropped
>
> I also have no problem enabling CIFS_SMB_DIRECT on kernel version
> 6.4.0 using menuconfig or nconfig.
> Or using scripts/config.
>
> --
> ~Randy
>

