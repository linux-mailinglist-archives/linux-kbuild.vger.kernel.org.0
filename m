Return-Path: <linux-kbuild+bounces-11428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I/tL749n2kiZgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11428-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 19:21:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214919C316
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 19:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 278A2309B277
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 18:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0D42E6CD8;
	Wed, 25 Feb 2026 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enakta-com.20230601.gappssmtp.com header.i=@enakta-com.20230601.gappssmtp.com header.b="MmZQJqoD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087412F068C
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043542; cv=pass; b=YJA5qLvTlU6jeCLMG5hz8lot5k0TaxXspFzTF/15Jdi4FU5VimLwkYSTCo87iHr0AnoB72BvcZ4NW91NqZapFRrz1pxnFj6+9MIIFhJmUgXwdQSHknEhiyUBqMuSU2W/Vn/pB4D2+jT+rHgw/LCKnDJo6nwievAWYTnCzZihax0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043542; c=relaxed/simple;
	bh=LRDz82JED2xeQckEz7H9ChbpfUpio2zNn3f/OFDohv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhGujbm2ciONuKxNRYnJOvevOmpf0x0pgkMf22zFDgGAtjKODRyWkrAo/lhyAHhaE4jV2793ie9+ODwxTpe9VvC0dFQnLHZdOgv3SG02Rz6V0ombGtP4CtlyS+vKtBJudveQPJ5F8pO565vb25+gg3+Rjq7fYFRuksxQQ7uz/Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com; spf=pass smtp.mailfrom=enakta.com; dkim=pass (2048-bit key) header.d=enakta-com.20230601.gappssmtp.com header.i=@enakta-com.20230601.gappssmtp.com header.b=MmZQJqoD; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enakta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enakta.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6e72d7a4d7so4406928a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 10:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772043540; cv=none;
        d=google.com; s=arc-20240605;
        b=ASemDYd/l/ahIB5p2xaJVQsWdYnEaGH1a9MDrNajQCZtTzVu+uVrqRBqHgLaL2anF/
         ery7Ne0Wvjkw9h4OQ4M14EZheW13zATj/cyXDLOVEzVWOagIL4JTiwiR7YX+JEFEv6xg
         /qCNdVjmJ4T1V2eEnHSQp95Nhnl8/ga29nP0QA8amh2TjL5WAymZmB7zdyJRqknMenO+
         /a66kZrxqoYc9pKgJJINj2PbZwMmapMAferchBD9OpZjBMo9axNRiojDJY9FrefSVBwT
         LvUorERXcqWmk9f4jA1WnfUSguAOF6mLKFo5ooajwQVUSYIPz0pJaEgACg93LNvUgw0J
         7y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zUmyD9mZSPiz34Jxj++5qqJO6oRTMfL2GZK09sjFXQc=;
        fh=H/kwftpgf3UqcPDtiBDG+vbzL3ixX9dCsyOy/n48rJY=;
        b=D2yMIC9AdYzpwfgEUwSPE8p03f7Z0NaSO6FrpXg4hpHscfHDt65j7TLZ8t50biOuGh
         sdMiHfEXZtBges3vEy0ngklgAm5lsFlhy6AQxg/ByK+fGFh1GfwLREScsi1DSS0tOxg5
         I4T44ebhb7H3PZFzc0e5mSILE9DB8EqbGzQwIg33sIrT5qtEv1DAz5NauYqph/N+KKUE
         p7VUYyrQCBMkxeaTqa5PL19HbDhux1CXivm3Xx2VM3EYBYiSfNXsfHv6M0lQn5LFSDwN
         XAQPbuUCTvqUzC2s4c3S6rjoC3h5oVSucFyJTexcZyR4FkPs/XARPb/MBoNJKr1QfTEx
         radw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enakta-com.20230601.gappssmtp.com; s=20230601; t=1772043540; x=1772648340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUmyD9mZSPiz34Jxj++5qqJO6oRTMfL2GZK09sjFXQc=;
        b=MmZQJqoD8T6f/BYIYZM9jMLo0IgFRm0gJg3J04nFvOuk26Okp1RrUIkemPRUtRiaIf
         I+SCGX6To7W7CkBeE2PnGfjc9eW4rDeVVwuYDRqWAk8nh0yVSW/FRnvWcfkoOYW3YiGW
         Q4TRsim46L7l90IZKcKajJo6N0qfDbiZ8+s1GRomPftbQQv9c7PrTEUwTO1jBTFHALMD
         kg54Ei0mvOZOLPGAylyp8Vu7Dx/EBpgA6i5yyEd3hK57IvUFpz8pN81Iyh01vfnnc5gy
         BtnlXTDKqywozw12SSDF/GtRLZvSdzAuVlqZ5aHUdIu5jJ5CAHYChBmAY6L3S/uysoPn
         xtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043540; x=1772648340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zUmyD9mZSPiz34Jxj++5qqJO6oRTMfL2GZK09sjFXQc=;
        b=A6re+aJwfDHLfWXdCBMDBgHqcjmThE4oaBPheexy6aI68zoDdgDghl1McWyLpw4lGn
         WgBjmqfipYSgtuI+jZf2wfmGGzx8agoLP70dIj6J3Bo4A9+prw0koQofhOU4DcM6MJXc
         5obqvA/jFgzEeCrtkR1Pe05C3NiWYsIhd+Xug27VuzLCy2oPK7imDfcfl+b8bSB7gw2L
         ECgT8eOUWbTXr4buspQ7Bq8abgEbLnY/bx1PYuCNrYftYtFCvcS01AIU+xie8c5UpbU8
         /NjPJHxoG/Dw0G+ER6sLG8P1ca2eTawj5qGeYAW1tFhbh7P6elnubSFcRAk1BsLpYrFN
         j1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRTx26Moq6dzOIoiMN7j3hQbynaEXCVCje1GDw0VUY/4htPWMVxFTCXQunysZYYDJY3WlR1T/ZN/oFHd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBFkTbPuF3+g8gdq7jyQJe363rWJEomXKMPrCoI+l9cRIqgBA
	ixfqBgEJcYMbp9ugnHKoAqLVUCMZcm5aUZgfyk3brflOVOWyQ80FmOhXJO1pMqhAv8+oFbw/TRF
	5y9RIQca4d60D17Zh+Dk6y+PrNGz9lotu2ifVm0YsuQ==
X-Gm-Gg: ATEYQzyUh7f5/YX0OI5apBcTRhMhDEKQteh7//K63QYHrEuUvGx8fGpt2Wd04DlZVre
	mqVaE0hIkH7e/DULiVeQHlW5zwaHm2AYj76SIDvqdaAlwvfwmVSw06fWVjntfEi5Y3mxEYyhGdx
	CE2hmesQDc8RMyaupeUMysamr2PJWcbLYBFpGRGAupMXgDgRF27LnhIjNiVxtD9PAaXsA3lC5Y+
	3QSlmd6t1WKEOcDeOonG9hAtTprVxdnqDg0HESunWVvin+VjXLEATv9H2aiSQQkmyf+WFulEgq4
	vKKmzAkKI/RURIs5qxL19kqEhsOfvN7ZEjVSf7m+uJGjdEjW6MNTzljRIJd0MhCmqIdGG8zOVvs
	ZoD0=
X-Received: by 2002:a17:90b:564d:b0:354:9c20:83e4 with SMTP id
 98e67ed59e1d1-358ae7c8ae1mr14170605a91.2.1772043540402; Wed, 25 Feb 2026
 10:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <CAH2r5mvcrt3T9x-Wqpz_OXVr9cWtBSft=JpASsFDT25CYtXJmw@mail.gmail.com>
 <f47fdd45-21b9-45cb-b322-d7de77b6bdea@talpey.com> <CAH2r5mv-JuF3GgyMdpSnaqazT4xP9U_8PorRiVy2Pt_v5bhSbQ@mail.gmail.com>
In-Reply-To: <CAH2r5mv-JuF3GgyMdpSnaqazT4xP9U_8PorRiVy2Pt_v5bhSbQ@mail.gmail.com>
From: Denis Nuja <dnuja@enakta.com>
Date: Wed, 25 Feb 2026 18:18:49 +0000
X-Gm-Features: AaiRm53y-pSZ_FU93QPHGKjNKt5HSaQemliMXq6RInicI5L2X8bpkZvQbudDpQQ
Message-ID: <CAGk60SFUePkcYAWJmAYVMU_MxB6y0XuaMBoDT_ze5R5+Vxi7VQ@mail.gmail.com>
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, CIFS <linux-cifs@vger.kernel.org>, 
	linux-kbuild@vger.kernel.org, Ned Pyle <ned.pyle@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[enakta-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[enakta.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11428-lists,linux-kbuild=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnuja@enakta.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[enakta-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 3214919C316
X-Rspamd-Action: no action

Thank you for looking into this Tom and Steve :)

Cheers
Denis

On Wed, 25 Feb 2026 at 17:09, Steve French <smfrench@gmail.com> wrote:
>
> Good catch
>
> Thanks,
>
> Steve
>
> On Wed, Feb 25, 2026, 11:08=E2=80=AFAM Tom Talpey <tom@talpey.com> wrote:
>>
>> It *did* reproduce - you saw the server config, but the client
>> config was not set!
>>
>> I bet this is the reason that Ubuntu and other distros don't enable
>> client SMBDirect by default! This is a significant issue and should
>> probably be fixed in numerous stable trees.
>>
>> Tom.
>>
>> On 2/25/2026 11:48 AM, Steve French wrote:
>> > It didn't repro with 7.0-rc1 when I tried it. Any ideas?
>> >
>> > smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ ./scripts/config
>> > --enable CONFIG_CIFS_SMB_DIRECT
>> > smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ make olddefconfig
>> > #
>> > # No change to .config
>> > #
>> > smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ grep SMBDIRECT .c=
onfig
>> > CONFIG_SMB_SERVER_SMBDIRECT=3Dy
>> >
>> > On Wed, Feb 25, 2026 at 10:24=E2=80=AFAM Denis Nuja <dnuja@enakta.com>=
 wrote:
>> >>
>> >> Hi everyone
>> >>
>> >> CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=3Dm and
>> >> CONFIG_INFINIBAND=3Dm, despite all declared dependencies being
>> >> satisfied. The option is silently dropped by olddefconfig and
>> >> menuconfig refuses to save it, even though menuconfig displays it as
>> >> [*] (enabled).
>> >>
>> >> Kernel version: 6.4.0
>> >>
>> >> File: fs/smb/client/Kconfig
>> >>
>> >> Current dependency:
>> >>
>> >> if CIFS
>> >> config CIFS_SMB_DIRECT
>> >>      bool "SMB Direct support"
>> >>      depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CI=
FS=3Dy
>> >> && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
>> >>
>> >> Root cause:
>> >>
>> >> CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=
=3Dm
>> >> and INFINIBAND=3Dm, the left side of the || expression evaluates to:
>> >>
>> >> CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS
>> >> =3D m && m && y =3D m
>> >>
>> >> The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
>> >> Kconfig engine coerces m to n and silently drops the option. The righ=
t
>> >> side of the || requires CIFS=3Dy && INFINIBAND=3Dy which forces both =
to be
>> >> built-in =E2=80=94 an unnecessarily restrictive requirement.
>> >>
>> >> Additionally, the CIFS=3Dm/y conditions inside the depends on are
>> >> redundant since the option is already inside an if CIFS block, which
>> >> handles that guard.
>> >>
>> >> Observed behaviour:
>> >>
>> >> menuconfig shows [*] SMB Direct support (appears enabled)
>> >> Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=3Dy to .=
config
>> >> olddefconfig emits warning: override: reassigning to symbol
>> >> CIFS_SMB_DIRECT and drops it
>> >> scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect
>> >>
>> >> Proposed fix:
>> >>
>> >> Since the option is inside if CIFS, the CIFS=3Dm/y conditions are
>> >> redundant. The dependency should simply be:
>> >>
>> >> - depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=
=3Dy
>> >> && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
>> >> + depends on INFINIBAND && INFINIBAND_ADDR_TRANS
>> >>
>> >> This correctly expresses the intent (RDMA stack must be present)
>> >> without the tristate/bool coercion problem, and is consistent with ho=
w
>> >> the surrounding if CIFS block already guards the option.
>> >>
>> >> The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
>> >> identical pattern:
>> >>
>> >> depends on CIFS=3Dm && FSCACHE || CIFS=3Dy && FSCACHE=3Dy
>> >>
>> >> which should also be simplified to:
>> >>
>> >> depends on FSCACHE
>> >>
>> >> To reproduce:
>> >>
>> >> # Start with a config where CONFIG_CIFS=3Dm, CONFIG_INFINIBAND=3Dm
>> >> scripts/config --enable CONFIG_CIFS_SMB_DIRECT
>> >> make olddefconfig
>> >> grep SMBDIRECT .config   # empty =E2=80=94 option was dropped
>> >>
>> >>
>> >> Cheers
>> >> Denis
>> >> Enakta Labs
>> >>
>> >
>> >
>>

