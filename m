Return-Path: <linux-kbuild+bounces-12399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFVYIMPuy2m5MgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12399-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:56:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E736C357
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB270303F83B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10F7411606;
	Tue, 31 Mar 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CSDuOvYZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3A408239
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971798; cv=pass; b=okVamVwYohW6bt0Kq7sepHD4xA5mr0euZpXuPuFhIE+8himy7GNg5Ry0j/yVWLeDq85uJefKQ/g3qEY+VPh1xoUc+ywqIHImNl6+CW+o+vv+aoW2VZeaEN8Rds9svVe3wW6TAQi2e9GNmqhLKJLlhxAV4ZhyWRNkSdf2vY76hbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971798; c=relaxed/simple;
	bh=7B9guYqc9Km4EfytW8PmhqDNaZArc5NLcTO6VZFjf+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ij1Imp0jP040MkA42DMynM812dxdQbSfzgbCjqHpG8sKQclHi1QmbiE3rItnF5RXFro4TgTUulHDCIC/KhLliiCtzZq5NH93CiFxAWFJ9BxpOBNB3S04fnIYKONsEXGQ8F4VpNWto8RvtNHXzcFLSRJScH7Pg5a1qCY8qNjs/QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CSDuOvYZ; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509069a7a7fso658261cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 08:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774971796; cv=none;
        d=google.com; s=arc-20240605;
        b=XN7c7vk2/Wb9fZqge8K+6y7l7lS13ces3IR5+F0P4kGahMBYmp1NkEQORISGSVZKrz
         6nO58jeBwXDJdeTi309TeTZXAPZZR+c12WalCSTf4FAGKlKPdeLV7fg8bunLrYcFJleW
         qITW1e5CxuNYyb52fx9ruAavfXoKKXd3KzuZVjMlkdKx/GQyTEFdWUvow6WhXXEGhvQ9
         S3xdcpHeYeOV7eTe3R7H2nwhdKpKwuICs+xEyyoH7R40OoMLeOt5AWpZ1EBMkAFECSAF
         Og7w1JQDRiW43Gll+ZLQOM6Gzt2XUDohCwDTa7sjzXume8vTWzXyJBq+Pcs2Vou+NyYR
         vrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W0esMwEn2vLErtLDITPF3oyt/KUc1Rilnuoy1Ok6WkA=;
        fh=MKzj+U0FWSgedX9ezgOAgOlVc4nRw6HYGZDQ/8GpIM8=;
        b=gW/nZ8SAZ/BoZ5vNWH12549WqngGyIPc98ZdwhXaM9mTdkOm3WbnvoKzX8uLFZsyOh
         M8SeuJBvCmGRlKZ/j25ghFJziEC2nIngkBeXxq/fBHLBsYws0Wwc0SqUyG7I8rDtzZ24
         wb8wmi5+JFBzDBNN2pCSgb8PH9Q+eC6vIs3rde6/CG3UwlNZLRuPosWabiXVINXqiB6s
         GUBwEzonkj7+RZb9hWYY8wf8rh/ogqGbcsEbswLmnLFvqVCrCPSvezaimLhHwh3twpZb
         jbW/VWvTqak7MSIRYFy/3Db0ZIz/Geq+zNlStOptbcEgYn1MT8MldlzXhxv/rPzN7Ii0
         p9iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774971796; x=1775576596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0esMwEn2vLErtLDITPF3oyt/KUc1Rilnuoy1Ok6WkA=;
        b=CSDuOvYZIQBL4jWhYVjEN8LedqCGddGCjivauKupP1yZuWfYumIyGAUvtAiPVnzg0F
         Q3p+MjeDrFdvCIt0iSpQpddQ3k9GInxNv1ezsLNaanDK4zXvatzOGKWNQ7cjbXMZwJzq
         //MmrdNbHpWN733Xhm8FcIKhOVuvrCxM4xLKnqQjeF4GLPPEQD8wPmg7ys0yRXTqyZGu
         urOWHW54fe39NvJiewDDFj8U7LegYYTREq7AC90oAChwWHwCr5ErNhoxeQ1gB05kUT2+
         RlE1U1ZgXSUUmhAHsgC8+ax1rYpmPASlMt5KIUsxqgUC/vG0ryIoucrgh9bNV80IwVuS
         TNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971796; x=1775576596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W0esMwEn2vLErtLDITPF3oyt/KUc1Rilnuoy1Ok6WkA=;
        b=WELznUhkyDLXUNAePyAP3gknYsRS/Aeujh8EgdBgMxC2o4tLaWvwxMRcCQAJlagSKa
         GnsHH4G1WVva6x+fKYjcNxF9Kr9YiN4kBWbuTjSHWm63jV39lFKbKQRFSpS3W+hcUJLC
         KiSgavZ8fnGQeVvlH3IQZMDtbV3l4EMxLP7Skt06ovWTCGW6vROA3gPi/PhFLtnRThxV
         gH1fwBH6Q8QyE/CO7zNhpQGosTkcjPIoDQFehhOppCFAxNMmcXc9n8wOQodnqPwC67LB
         Hi1r0CeLlY9ImfVav6cC9h3VvCc+4hTHDSI+eYPOAfOIRSP92hutEDINikpFTH/LfBuz
         gB6w==
X-Forwarded-Encrypted: i=1; AJvYcCUqHEq5MZxkG2j5dcNlS2RgqnKKaGuBoLlspxqVu6tJGcsJsIT/ZhCGr9pO+4mW+sG4ZdIkhpId4pUBLe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4I9aghA/Nyaw/0mCCEPskZDC3Yj216rNlkx3+RIx4gp8fCPE
	pDfz2DJLAbJciU+xSQoR9yWOpv5jKpY90b6OPGVVqbOiMRisXmstluvtDKdJoPVIgxKcN+18lw9
	M3Zs0ew4r0J3OQmNVpUDsGjRVH+isD1qksIPrz7Mr
X-Gm-Gg: ATEYQzzKqUuQjRWxOIf2dugkVZVRrQA9575Zx649D6eFM5hVaQ/i7mwimbHnTUm8bjs
	aelywOLRpZr4tz7yJYRBjAG8rFfUUtNlSemPqTs6DAEeoZL0SBq/zhqPuLmZgaF4kEMrMqe94iY
	P1CLXzDbCV5qDh111gjlxrp1esxp2Sw05oleZql4wgqlEoU0JbeaVMINGYUe2MNVza9I6WYPSdF
	uc4Jz/2tQpxw6A7cYQBfk+S+vZmBPMki/X6RC3Qur0bTuW1CJfIBo4nFiDNyqmwlYayTy77AT5D
	BqTdOmewwQv41mnF/z/3pE2WI8J81uAOfdxEoSntjPx3ag==
X-Received: by 2002:a05:622a:684f:10b0:509:15b6:f69f with SMTP id
 d75a77b69052e-50d3b726614mr608181cf.2.1774971795337; Tue, 31 Mar 2026
 08:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330171920.2026779-4-xur@google.com> <202603311739.cjetLeNT-lkp@intel.com>
In-Reply-To: <202603311739.cjetLeNT-lkp@intel.com>
From: Rong Xu <xur@google.com>
Date: Tue, 31 Mar 2026 15:43:03 +0000
X-Gm-Features: AQROBzCj5K3gmeJvf_anMTGWwniMI1Tm2F9Rl48CsSn4OuK6msMlbCTz-rYMEjA
Message-ID: <CAF1bQ=RUUcs7ftHx+f-0DyPeCXBDa8pVt9cYaVPbxpkm8XkMEA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] kbuild: distributed build support for Clang ThinLTO
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Teresa Johnson <tejohnson@google.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12399-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 816E736C357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sorry. The patch was wrong.
Let me send  the correct one.

-Rong

On Tue, Mar 31, 2026 at 3:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on dcc99abebfa1e9ca70f8af8695b6682ad7597bf2]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbu=
ild-move-vmlinux-a-build-rule-to-scripts-Makefile-vmlinux_a/20260331-012908
> base:   dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
> patch link:    https://lore.kernel.org/r/20260330171920.2026779-4-xur%40g=
oogle.com
> patch subject: [PATCH v8 3/3] kbuild: distributed build support for Clang=
 ThinLTO
> config: x86_64-kexec (attached as .config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260331/202603311739.cjetLeNT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603311739.cjetLeNT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
> --
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
> --
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
> --
> >> Makefile:2254: *** extraneous 'endif'.  Stop.
>
>
> vim +/endif +2254 Makefile
>
> ^1da177e4c3f415 Linus Torvalds  2005-04-16  2251
> 46b7c49254f89d5 SZ Lin (=E6=9E=97=E4=B8=8A=E6=99=BA  2020-03-01  2252) en=
dif # config-build
> 2042b5486bd311d Masahiro Yamada 2019-08-11  2253  endif # mixed-build
> 688931a5ad4e55b Masahiro Yamada 2019-03-19 @2254  endif # need-sub-make
> ^1da177e4c3f415 Linus Torvalds  2005-04-16  2255
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

