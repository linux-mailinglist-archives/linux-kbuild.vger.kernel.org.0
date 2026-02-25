Return-Path: <linux-kbuild+bounces-11442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBINGYSJn2mmcgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11442-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 00:45:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6D19EFC6
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 00:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E0F3007C88
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 23:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3479B277C81;
	Wed, 25 Feb 2026 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5yBgpzO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45332C3244
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 23:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772063067; cv=pass; b=J6JlnPewxaDT/OnSdxwlamStDHzB7/+lyx20o5X8qukLTX+I/HLsLyia9UvpFEmMmffkdRKdDAz3to7Am3/XVp6IKycZEHqYPvE1TMNjZu+U5vemOE5SB3k6G3+rXaBkbNHffz/AxW7coo3mnF5P6xT9DVliuo44AiiiAOrj34I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772063067; c=relaxed/simple;
	bh=XdKE3yy8wq2vvQgm9uACWKk0p0lqSdkMYrlPacxCtKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LetvzYbZU2BfXrLZsp5I/vExsGvZqeOYO2B5AdZhYWs6XRxki+7godcBE8LIS/5ySrPjmIXyWtJNq26Qni4s3AKSfaEFSqlL4z1185wHnBGMoHa5p0upR/yuqK9aW5U7Lt4WUNQl8RP2fRUHUom+3pX247EU3FU2M0lqRGojM7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5yBgpzO; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899a615825fso3421226d6.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 15:44:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772063065; cv=none;
        d=google.com; s=arc-20240605;
        b=Efgv6H6PKNtNpcVYkncdC5MigF2jpmudqzYzekzV+6xrkTUIDMr3z/a3AW90ZNMhR6
         66QMXMj3HXSNgZFTOTL1kHmVNE9SKECPtbqKydRMr7dcUsUD/YZow71dTIMUgXmIIuCE
         rr3GwiYTmTwfulfr0UUdU4qCuoT9z6DQf1wzGX+rRmBK9GE+86hgIL9t8YgCCI414QJ3
         XVgOW4rAk9HeTVlrHJSAHp/0MMZ9tuKP9ejs2Qgr7zUi8aaqTgg/RzAGGmHXPQtL5Khv
         z0TUTyfLowmo6p3qvbyuUL3/GVHnvaPb2zds3LLbiPxiLFcGs87IpbCAl0v+4xOVVFyI
         8nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aX/9nbCzmF+1Y2euIFT278sMLN+4qQZ+ZIeORha/tRY=;
        fh=ELldkQ1ZI7yFqOobzV/pDHLkynPxLgNzLkiE/I62wLQ=;
        b=MW1gLbfcQDtUfMBS6160tnw2qZERttL9Ee2T/LNmNYvtd7f5y+U2E9pAWY3CjGvVZI
         k14RFOTMP0lKrFER9wOb8v6amNWOAx/UOfnauG7H88ymHLL1385SONdjIvI5DgKrV6IM
         VB9jzJ/o0KlHrK7meVvOp/Ol2l2Lw7NMrlrl0Dkeuw1HCTeqo3n4ZF+qYKpn8K32LgeK
         X40sxQ642Nu3T62tyGMxeNsr8/rj9yryrR8Of6eVkcCP6h9yoEDTB21oPmpTZloDlEgb
         rtHQ8O61UGkZ8BhFE7Hm8jzreXfe2dydP74kE1YSjUhgIS1cFXBgofF4iNG59/fMdFtL
         Kqqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772063065; x=1772667865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/9nbCzmF+1Y2euIFT278sMLN+4qQZ+ZIeORha/tRY=;
        b=k5yBgpzOiSKajjVkj4aLuVhyNW7n2gViJDsqNCi+q2u5LJq1X+uOHuzIZ1laInCQQn
         AOEih7Tls1MNmz/NTmtKxIk36Qfm3jZYLGPo+Wq/45l7MFIbNOFCnXkQeRXkYTK8eBsF
         EU+o9hNjo1hTQBpl1q9HOgmU1JWDYKAi4A59eWkLKx4VOVBrVdP/gynrg/65laBUkag/
         YlOH8FViDZ92HxDwIQO9QYV1Kxr6kAHuO+Rl5+f8AXYYuujLDcanF+qVAR/TuADY3uUa
         pqr+e/xjiD1mhI2/I2izfpahiVophWK8jtp3Td7MufOK1K4SwMvcPVdAWJdZ/WRLbfw8
         28zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772063065; x=1772667865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aX/9nbCzmF+1Y2euIFT278sMLN+4qQZ+ZIeORha/tRY=;
        b=ltFnLqbdDk5Ob8u8Dfl6SEC+958Lnce0h+eSCG9mqoTb8vH7t0nSYq78KsjTAVZpJg
         tCEOxN9/pI92GKbzHsHFTfDWemFhdDw0OEeBNzZYGAemk406GRka30iUwnKS8ylIPyUE
         royb/i8YZwuWy51sXaAm2gCAeddANzX7JfDLAXGk3NQmF4Edv5bO39LZC3m5wkb0XioW
         EUhzAKU9PhXMY3CWil/rce3urisa6QPxK9JtYAYClN14kyVImLAH7OvxmS/T83ujLlZ1
         9kyIz7H1Hu1UaXZemteaoGkYPbaLUP1HYvV+G39bDhAVDjSz3zYBbQpONX0u4bHVDV8L
         MIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVU4k5GU822SpC8Eaxt0DQ9DXAh6Ia0AAmU6S8WkCKOnxUrRG9+Gw7JlGWgoXM1UJFZn+pxKzfUwlsyhQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+zUMPFNTcmNKU6IiGejRlta14ZNfXf+Xpav6XYET/6r5bpTU
	klWZX6yA9Inu9K1xUbcX17Tv4mEn6+MHIucomTM/j1MAPqHgj9rH6lknGZIfeSHu6jlqHGo+AtO
	y2u7l3MYwgfn26OeQjlYfnKj2s7iVvjxvI7GB
X-Gm-Gg: ATEYQzyLtjlMlf20+LHuN2hh7YOCJRJzUXHpIE5oOlgEVqDBUhivo4SNucrZ+Upb36a
	OS1kZ2hkkBo4AfOB9Xtv3U23hQNvvOGU+XflcWqNHmo8JFJE4Bhs5z1+APhHfK2iKFA2tkJ3063
	m4PKFXRT3zvI3qiFlMmFFwLlKp7sm1MT1x+padikNCkwLnFiPGPqlNmkpnOYeJnSO4TwZt8SelH
	ehPUd5SSi55JNP8LzdpznkIdvMKPsgm2hAoiiA10GdIRBB+O8IA6+vhJF8rYgNODBhOOZDGwDkB
	FVqlJDROmUBA8eLTkgUkJodJucQSCIE18i/zIvU18m6sGSqvipYIR7wxOR7A0xYvp5poUYdby0h
	wIq4dKrNKbFFo5ADQWjIylolAd5FEooH8RUctHZ7BSs0Ch+wYlliS5MDjiKKVPZk=
X-Received: by 2002:a05:6214:c2e:b0:895:4b79:83a5 with SMTP id
 6a1803df08f44-89979e1bb72mr255943186d6.5.1772063064749; Wed, 25 Feb 2026
 15:44:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <CAH2r5mvcrt3T9x-Wqpz_OXVr9cWtBSft=JpASsFDT25CYtXJmw@mail.gmail.com>
In-Reply-To: <CAH2r5mvcrt3T9x-Wqpz_OXVr9cWtBSft=JpASsFDT25CYtXJmw@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Wed, 25 Feb 2026 17:44:13 -0600
X-Gm-Features: AaiRm506jZKxMy5M-FfXTya2AEiZlvM5b9TBUAOlxpKMdmSwkWkP6Pu_5WC8u1I
Message-ID: <CAH2r5msOakDTcskvxWEy19Z9N3OaR91qtDDfPQWRTVbizjDR3g@mail.gmail.com>
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Denis Nuja <dnuja@enakta.com>
Cc: linux-cifs@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Ned Pyle <ned.pyle@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11442-lists,linux-kbuild=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[smfrench@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smfrench-thinkpad-p16s-gen-2:email,enakta.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B9E6D19EFC6
X-Rspamd-Action: no action

Are you sure you are grepping for the right thing?

> grep SMBDIRECT .config   # empty =E2=80=94 option was dropped.

You grepped for the server, not the client config option.  Can you
repro the problem?

/cifs-2.6$ grep SMB_DIRECT .config
CONFIG_CIFS_SMB_DIRECT=3Dy

On Wed, Feb 25, 2026 at 10:48=E2=80=AFAM Steve French <smfrench@gmail.com> =
wrote:
>
> It didn't repro with 7.0-rc1 when I tried it. Any ideas?
>
> smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ ./scripts/config
> --enable CONFIG_CIFS_SMB_DIRECT
> smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ make olddefconfig
> #
> # No change to .config
> #
> smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ grep SMBDIRECT .conf=
ig
> CONFIG_SMB_SERVER_SMBDIRECT=3Dy
>
> On Wed, Feb 25, 2026 at 10:24=E2=80=AFAM Denis Nuja <dnuja@enakta.com> wr=
ote:
> >
> > Hi everyone
> >
> > CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=3Dm and
> > CONFIG_INFINIBAND=3Dm, despite all declared dependencies being
> > satisfied. The option is silently dropped by olddefconfig and
> > menuconfig refuses to save it, even though menuconfig displays it as
> > [*] (enabled).
> >
> > Kernel version: 6.4.0
> >
> > File: fs/smb/client/Kconfig
> >
> > Current dependency:
> >
> > if CIFS
> > config CIFS_SMB_DIRECT
> >     bool "SMB Direct support"
> >     depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=
=3Dy
> > && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
> >
> > Root cause:
> >
> > CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=3D=
m
> > and INFINIBAND=3Dm, the left side of the || expression evaluates to:
> >
> > CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS
> > =3D m && m && y =3D m
> >
> > The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
> > Kconfig engine coerces m to n and silently drops the option. The right
> > side of the || requires CIFS=3Dy && INFINIBAND=3Dy which forces both to=
 be
> > built-in =E2=80=94 an unnecessarily restrictive requirement.
> >
> > Additionally, the CIFS=3Dm/y conditions inside the depends on are
> > redundant since the option is already inside an if CIFS block, which
> > handles that guard.
> >
> > Observed behaviour:
> >
> > menuconfig shows [*] SMB Direct support (appears enabled)
> > Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=3Dy to .co=
nfig
> > olddefconfig emits warning: override: reassigning to symbol
> > CIFS_SMB_DIRECT and drops it
> > scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect
> >
> > Proposed fix:
> >
> > Since the option is inside if CIFS, the CIFS=3Dm/y conditions are
> > redundant. The dependency should simply be:
> >
> > - depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=3D=
y
> > && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
> > + depends on INFINIBAND && INFINIBAND_ADDR_TRANS
> >
> > This correctly expresses the intent (RDMA stack must be present)
> > without the tristate/bool coercion problem, and is consistent with how
> > the surrounding if CIFS block already guards the option.
> >
> > The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
> > identical pattern:
> >
> > depends on CIFS=3Dm && FSCACHE || CIFS=3Dy && FSCACHE=3Dy
> >
> > which should also be simplified to:
> >
> > depends on FSCACHE
> >
> > To reproduce:
> >
> > # Start with a config where CONFIG_CIFS=3Dm, CONFIG_INFINIBAND=3Dm
> > scripts/config --enable CONFIG_CIFS_SMB_DIRECT
> > make olddefconfig
> > grep SMBDIRECT .config   # empty =E2=80=94 option was dropped
> >
> >
> > Cheers
> > Denis
> > Enakta Labs
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

