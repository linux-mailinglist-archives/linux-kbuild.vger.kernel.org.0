Return-Path: <linux-kbuild+bounces-13200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAbKIemOCWoyfgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13200-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:48:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E332D56053E
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC89030078F5
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605173382C9;
	Sun, 17 May 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCfhkVbd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FB7200110
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011302; cv=pass; b=qSHZHu74kS9B5ETzEOrw6trW0+rkbHdQbw6zB3fdRB0Lc/BilABao4xi4bfDpYVtNS7TQkmOvYnkw+Xp0c43cMoHhPF1DjXpW+jIgtgbWzCLCddEumSJEJEtWAFYrZ98Aem4UaNbiC9SZFnw80n78EIKHdfeDOzZqs7XCn5lLCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011302; c=relaxed/simple;
	bh=fk0uhQwp4prrEBPZo/QiveKATOKm2IGlddgiGbufK3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfx7pHzbdOYI78pda9EG/09gsYwh2qiFTaON4m+ABMUmErZILq9kA8GIRDzgGjs03t96lZe0pwtltxbCJ80fqxo8K30LLXY3glKkNOrKjHbbo8NffxSQAolxod0CWU9BaqnYUZ68vxf5HQiFkExokmpvoODo/H+F/XmAXKaBO7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCfhkVbd; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-134e41fee21so77187c88.1
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 02:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779011300; cv=none;
        d=google.com; s=arc-20240605;
        b=DibCGkJcNscQ8mEcH1p3NtPKmZod5wAp83/UiX3D5vMYWvGO05maK9so7Wea2todzC
         wngYYdNTiZLSB/kVgox9z6xMxMhEKhHv14G8fglbh1miCH/dx4BPRjZgg3BFiUawCVbZ
         VuTsMwblHqyJWwqophgc8pAX+eb1dDTyV8yz6EkPWpFxvBF/MUaoCV39GxS2WbfDqmrp
         HTIMKTcu7XI3kVCMD+OS0oxOOy8td5FmcOnRb6hxX6DYQSRugMotvrOjgVQT5gv2zvhC
         6lggqdk+Q7+F/ZN/6ompqbYB+bOlGGzVBQr4mXUaFl1CrjguZXdWdk2JGl8wc/nSWVgb
         Eu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        fh=yhe3L4YwDg9TN5NWv5zbkgNVW/gBZh3LXhkoiV4Ggjg=;
        b=ZrUhYzISqD79l2PhRTGTQMuLSA/fDC6mZN+WGvakYPUB0fUjaueHwpx/eS/7yhq4FF
         jJQ66ds37GxsVcbeBpe4GLifUd2AHc3n/8lsuT1vDIocW1W6Q7puRzRQEwBdPNrwREnu
         gvPFXDidGnRk97CmfP0XzpQyUtIov61eUk7dFIHUz3NLp44KEEAtnK8g607jvecilONQ
         RtZkUBI86pT2e3p50vP610vSTsH95Cq/8VWiQK/okXVuV3RS/krghPdlErLsw0gGABAg
         u3zgoxDQARJwU/Rkq36tXy9BGtq9xOYtLIK5SqdvwkPC4EWyGPbtAtA/1FpDmTsAaAJh
         dOHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779011300; x=1779616100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        b=GCfhkVbdOCQN8/igHWR8gZVhwCFhk4HQztU4nNEwUtkRUFgb49b11z6YQPohHl3OX3
         WxyAr3A7XAqkB5i+XyOpcQ28F/Wx9pnc7+B7hHpWCcfuCe1aSl6XaDf/CuKuDRE2fsdw
         VAXz4MbsZtgrKiH5jRywsoeD8mhFZXpauULhtDE/MY5A+yD6vorEZ0vM+Ocms1j762im
         X4jYdmF47TB8PgA3x6A+Z9o3gNpkD7v2DBFzZ6mOEZ7hr1NHNtTftmVELNomnHr6+yE9
         X9pS1Fu2cmyKKPSx25Jd0UvJA8BvuOqoZHwSRxZuRz8Q3WOdpc41dqUYeqgNqdjLwFgK
         9GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779011300; x=1779616100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        b=NwmtOKN2fFn2Pf5W+MbK7IiWg5ljSC2Ic9AVMkbX75Wa/9IZaVoSjMZpgHbnO239xT
         SQJzFh/TrvOgQ4j+UNPFHa1E9giz9s8uxCOc3oGnXZElTNdOBo+gFdsYK73RcFFjfCCw
         ascri4p20ZigRS4FkIZjKJCaXwrlof3UTiKkxp8w4Ykqf1jq4sxLtU50gEIKWE7S2sAa
         YmLeuZ3rJ8lkUmKDYg1vylfA0sb45wc4iqCmlqAPXbIsuQNeO++AtPNkbfXPsQqXd35h
         5hbeBIQS+GSJGRsMgSNpOBiqU0/wweHHddQCrChFB9eCIBNRkG4YiqFTo7YZ2LU/fJ0s
         q2pw==
X-Forwarded-Encrypted: i=1; AFNElJ9pGNHc8fo7Nsyl8b0eJLlmQvOhIvMceAEuwxbxQPBJRGX5zASenjEgPRbDSCuRRou24OnsjZDFkeOAY+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YziE2MlEfLs1L/qm8QKiMIt3j0HYZFZdoCFCROlCiW0rbdptaq/
	oHqd1S0aYYs49RNI9gyysKgjUtItJFWawlDuXx9pEEGEswfCSFNNct59ERrIhn1oV7McJu81AkI
	+8CUGrEJ+iRWPrPDv0VjidYudKV6BMpQ=
X-Gm-Gg: Acq92OFFECkulRy3Agv7FwsDDASyOTqAzVj0qRFH0KoJjuIbyP85YMU84Da7IJ6LKte
	BxH4hYCCjXg5q402WB02q+xV8L+0Ydsbd3ahdRu/oIhRnkCKtqjeG6TUbFFjNkh2rpE1EFV2TBI
	f2O78wNR9/4x8XO5mETDMgN8pMlowETHuBAEwFAgHUF0mL8WwziQdrEa3rqdsczkXVMmOLGZP+8
	vMd1ZpViEN9jH/Dp9tWkLK1jOZ7LD8jZMzj0JH+JqHXw+Wm9BwbriE6Poz4X10GYyTuy6peASBw
	fv7wbOQJVO2/p3XlQJ+jU7g9cj3ivVSZxG3Bzh4juGh26SfIabiJM0KYBNkO/kaehC+dnytBro7
	8wecYEkJVyLl5KfoFwNJbk3o=
X-Received: by 2002:a05:7301:6448:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-3039868bb9emr2318584eec.5.1779011300185; Sun, 17 May 2026
 02:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
 <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com> <CANiq72=9nxRgfFf1WzWgp=TP9or=Mi=wLyME9-f2M4hti+ZNcg@mail.gmail.com>
 <18809682-aa16-4ab4-b615-cefa525c872f@gmail.com>
In-Reply-To: <18809682-aa16-4ab4-b615-cefa525c872f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:48:07 +0200
X-Gm-Features: AVHnY4IqZjwtBaQ4bjp2dDDFDM7IN9UCZH5fs8MV0fMtXZ3wLSajt2Od6R0WmJM
Message-ID: <CANiq72=2CFJGPcO_zP1wbgXiDAL=gOUcHRMMP_bEUa1U0rZB_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E332D56053E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13200-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 11:33=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> That's true.  Some distros (Fedora, Debian) don't like that either,
> but that's a bigger ecosystem-wide concern.

Do you mean that distributions would like to package this tool on
their own? If so, I don't see why packagers would be blocked.

Cheers,
Miguel

