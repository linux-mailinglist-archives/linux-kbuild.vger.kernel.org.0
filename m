Return-Path: <linux-kbuild+bounces-3840-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A625398AC3A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 20:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 130BAB21350
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 18:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8460A197A87;
	Mon, 30 Sep 2024 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJLEL2nS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476B195FFA;
	Mon, 30 Sep 2024 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727721485; cv=none; b=iB27iVUPjJxfB5Y8XAbnPgFdlT2TyJhFh7rPwGq3CG0IIPzvONWmZuZNuTwhXdLZRghs0k6Wyt80tLvKMSeOkKNHevA32lwGeVr+vmR8gWfb7HKVQW8UtaqiMnQO1JDYTnUQkUoWrqiWlLbv2pzRnEgoFBhy4EhLW4xMftomXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727721485; c=relaxed/simple;
	bh=EHajHhnG1NWzp4AWTFsiEvs213YTpEXq5SEcXkGZFQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDyNR1e1HolA87WXJ3IKatz0uKIYqKFb2Yh03bvzL3ZrjZ2Hr/zCon2aiqAYSaRl+gcfLJWPsBELma+vmvg2+t2uYWIWWmMSsbgxZTBEK+H2jR8GU6inUN7V+rEC2n5ZMFcck442Q2x7SOEKbpTwM+0ymaHpHEr0sl+qA6UAKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJLEL2nS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7e6e6c0cca4so220854a12.1;
        Mon, 30 Sep 2024 11:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727721482; x=1728326282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHajHhnG1NWzp4AWTFsiEvs213YTpEXq5SEcXkGZFQs=;
        b=WJLEL2nSw8waaZ+maAuN0j586skxU0Gh4PbKAH4rcNH7GGkyuv7toG7XXNfyKp+RRy
         jdsigsZQu3IVbmfcDDxAcl6G46+oKoFnSvlDH2oPLE5ZIpRsgZf7DAWeEPpvyFcYiz1f
         p5W8api5WWgPfLqPImDK5bf1upcjFHt5t34Lpe1OEbnQ3SV1g+lTeD/C1HYaXkpa9o11
         PZ4e2ZnWdFM4pMDvOF4OaaqdJ+q+EucRv2Y2hIWGQwCRbTLomvbgu6p7lD9epaqdOWAM
         zhH19PoucZxeQFQnWg72rlw2FDLxhdr1Qxl23r+aLyL/H6AHvmrkdL71XLCEMJha+nHC
         lzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727721482; x=1728326282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHajHhnG1NWzp4AWTFsiEvs213YTpEXq5SEcXkGZFQs=;
        b=H5dZ/hxuFNkiIJD4hPyVkQNhOWI8GWfA13zKxB1962Mbr3myGSD8eksQnRyoR39QkT
         HHg4ZFdNLMCCfpIwIB2Sv919DBSjabwjO2YDufJIFgezrq/cvtNwxBwtilQ79wmoPBb2
         cGnifM5Don6RHjuK5F2lHV0vcYXOud2RfaujuY5ikKM3ECg/e8A2UACAAl9POmu6dl/F
         d0cL3Sr0t129Ni5KFgLp1Dqs2Ozp/uXm4/Q+PgIgxhUCi+Fk0NUBO28LrBPYGnA2yJ+j
         zA/vDHMZbjqtRhwtZJpU3KaTYf/BXyb6OGt23CqE861EYMuaf6pfiaYkwlyIs2J2K4bD
         k8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCV8+NQnf4CqlBG5hMqjGNVUun5JhjqRvNV9VQEnkbnOWzdwR0q6i+Cn+IrqQGBLeD4O9OJHVzJtsXtM6LONxY0=@vger.kernel.org, AJvYcCVOfDpCAYXzmCG86ZC5eFmiUxEF3WJC2tyFMwUVGzdcKgLT8Zz2fcj7h7kZ8JfmA1UxXV1/WQKgUBfYbj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlkKO5J97pcEJM/8nO1z4Ce76EvyHGMCYe5qvHmOLqeVCdTea4
	ZUoDYtkHvUzcOfS/pGY5GzMPzB2bsCpAGQSHQn6RCS/3KROCA6RU9Qww1xQalcOtG7nJTKx6vVP
	McrHaqIFOtIH7EQEwySmfqDmFaNFXQT8r
X-Google-Smtp-Source: AGHT+IGgOJdK4o2PIvXIXal6ErVxvW5ybldfZWC//uMBUoqy1SHRwAHnbcIswywzr34mIzxc+RG0mEOXcXdQPMRrgmg=
X-Received: by 2002:a05:6a20:a113:b0:1cf:2be2:6524 with SMTP id
 adf61e73a8af0-1d509ba84f7mr6434621637.10.1727721482398; Mon, 30 Sep 2024
 11:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-9-masahiroy@kernel.org>
In-Reply-To: <20240917141725.466514-9-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Sep 2024 20:37:49 +0200
Message-ID: <CANiq72nPAn1HWwHBL9qFw=V-BY1F3ckgmkb7c23vfKuH-oB9Qg@mail.gmail.com>
Subject: Re: [PATCH 08/23] kbuild: simplify find command for rustfmt
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 4:17=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The correct use of the -prune option can be seen in the 'make clean'
> rule.

Yeah, this `-prune` should not have been like that -- sorry about that.

The comment above this recipe should be updated.

I am not sure I understand the part of the commit message about the
rust/test change. Do you mean that we should use `srctree` in case
there is a stale one in the source tree from a previous
non-completely-clean in-source-tree build? I think the original
intention was to skip the objtree one if it were a subdir of srctree
(and that is why the use of absolute paths).

Although I think we can simplify further by just removing the logic
about `rust/test`, since we don't generate `*.rs` files there anyway
at the moment.

Cheers,
Miguel

