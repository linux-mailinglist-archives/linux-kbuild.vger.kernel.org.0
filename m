Return-Path: <linux-kbuild+bounces-1775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C228BBF9A
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 09:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 746151F21666
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 07:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6F363A5;
	Sun,  5 May 2024 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTXMHCaT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466A6112;
	Sun,  5 May 2024 07:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714894006; cv=none; b=tdywGJCn/pqLnmQ7hhBZtJyb9iTk3MfLBTYtqa6p0/WSEsO/ejv7qhIaR/8MdpoLh9NCyFLEgINP5MCEmddhgYpJDRGxzCS3FNxlpu1Ao+6dCxqPMwwtrShL0t+lGI1sMnXxAEeK0v5Yl5PUskVyP70ALl9PYbpgu4+V3AztOzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714894006; c=relaxed/simple;
	bh=LeHHGetyMUSrlkFHEfG0Vt3DO6MMorzrOqzWDlUmXa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7hjeAbpnKJqEVHd2cbYQvlvYevJBfSsMCjwvaW02MVLFbGyLs04aw8hO3arHU2AXQs1RVEc71mrh7tBEJZ18om6cahdfLk4M+W5cTdyas8H9B04GqLqw9JGwpTLrnTLduyJ77qT0XbAZcXiZdsYZi/G8yrvvYgm75woKd25eM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTXMHCaT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b49162aeso126718466b.3;
        Sun, 05 May 2024 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714894003; x=1715498803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deKeI1G9ttkrRvHqpeAP9bWVRIz30uNCr5BsQ+5FlH8=;
        b=mTXMHCaT2mpSONBZck8fE0HRpcxWGLXoxfc6uWGSfoqPdu7Z6CkeqmFwNH3nf0lFCF
         n9Bpo2Ey8L8hukj0bP1yexJCraE6WZU966gA4cwncfZCgz0J7zYYS6Vr5o2XtBG4NO8g
         sJTQrRLe/RucB73rFwPLiuYScVk1xMV0mdBjlUBpUDBeuLa+02u6y5jz4BCHe1r065mT
         kiN/fNZl1hr7o95exkVHxlSLlvwnPFa+5L/3D5VG6vxBud9Ck2EcesvhjGTDXX08v9yp
         2DeLm6S9pflsdKnYsJiU5z4Gh8kJLSotTM2pNEsZb50l7Mrz0/bvYIfNndoYruXd6Q2h
         z5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714894003; x=1715498803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deKeI1G9ttkrRvHqpeAP9bWVRIz30uNCr5BsQ+5FlH8=;
        b=PxniLtgoc7OURk8QJbx1Qvdt5RppNLs+oc00iRobQO4T8vAmr5s8FWeFwry3HdVTRg
         I8uiNWFwwsstrVqI27E7AKo/6Nq9ES6oCkqlI4GB48m1T9a5gLyKU4yk90z/s30EFHUo
         XXBn2I+YbR3mEFDNHRZiqn2JFoIfF9SelIZUCrhUG+rTpjZHP1Dfe5vWEkbMXY2NWfMO
         oV6OWRJRKVyFKxNHnXu8z9F+omIvLAbgrveGIfCZyAlP9HdSH+KiSNUYO8Lol9JrXaHF
         dGpaOqaORTzEwFGcbWpnRNcUeREv2lFJuFFHBonBgRmIe/f13gZf0qjvyU6F9qCposEp
         1hgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuX7Hts2npzm+l7G+8Ar94H1Z8Y95fyLObAqnemVKjctTpYiiX9EztpzsE6J523MUKR75OKQMjX4u8pCWYWWhFCQZoYAA+oiU4T6dCJkizLjF7U9b48VpBxro34vI/0n3QEdD+SaDltxpw
X-Gm-Message-State: AOJu0YxFHscd82vgiyWzOqNp2vrk1D/l7wAk+1GULNEJKlg2nxAeAq/y
	RczqZ4skg5+Y+/lvFhxhzmnLXWhjzXUBCVRi2UejIZ56oPL5RL5XSdvOSfpm
X-Google-Smtp-Source: AGHT+IGAmi5n03zMIWrhIV3Cl2hz5vmpuQSwRrFBXAadNYWEGYZ+7Kxc2dpt7Laio4Ky598e5hwjjA==
X-Received: by 2002:a50:8a96:0:b0:56e:2464:7c4b with SMTP id j22-20020a508a96000000b0056e24647c4bmr4567906edj.10.1714894002632;
        Sun, 05 May 2024 00:26:42 -0700 (PDT)
Received: from gmail.com (1F2EF54C.unconfigured.pool.telekom.hu. [31.46.245.76])
        by smtp.gmail.com with ESMTPSA id er21-20020a056402449500b005726e5e8765sm3705962edb.3.2024.05.05.00.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 00:26:42 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 5 May 2024 09:26:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.9-rc1
Message-ID: <Zjc0sJWqfMWFD0/p@gmail.com>
References: <CAK7LNARXef6Myb_Gd4jyGfwujoBAjmjzLZBzgkm4T1KmfHP0MQ@mail.gmail.com>
 <ZjcRPelwZP34N42s@gmail.com>
 <ZjcSjk0mXYopAvVS@gmail.com>
 <ZjcaHRjZDdy/6/rn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjcaHRjZDdy/6/rn@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Ingo Molnar <mingo@kernel.org> wrote:
> 
> > 
> > * Ingo Molnar <mingo@kernel.org> wrote:
> > 
> > > Notes:
> > > 
> > > - Yes, those weird 'file' and ': No such file or directory' strings are 
> > >   pasted as-is. No idea what it's about, and the build log doesn't say.
> > 
> > Forgot to mention that I also did a KBUILD_VERBOSE=2 build - which isn't 
> > more verbose for this particular failure:
> 
> Another update - I reverted the 4 most recent commits to 
> scripts/package/debian/rules:
> 
>  b8d18fee7aa2 Revert "kbuild: deb-pkg: show verbose log for direct package builds"
>  82ac586caf3d Revert "kbuild: deb-pkg: make debian/rules quiet for 'make deb-pkg'"
>  0b806eac90d6 Revert "kbuild: deb-pkg: build binary-arch in parallel"
>  4b16391dc462 Revert "kbuild: deb-pkg: call more misc debhelper commands"
>  f96beb84eff6 kbuild: deb-pkg: call more misc debhelper commands
>  1d7bae8f8c85 kbuild: deb-pkg: build binary-arch in parallel
>  caf400c8b68a kbuild: deb-pkg: make debian/rules quiet for 'make deb-pkg'
>  cc3df32c9f3a kbuild: deb-pkg: show verbose log for direct package builds
> 
> And this resolved the issue, the debs are built successfully:

Update, the bad commit is:

   1d7bae8f8c85 kbuild: deb-pkg: build binary-arch in parallel

... and reverting it solves the build bug.

And my Make-fu is weak, I don't see what's wrong with the commit.

Thanks,

	Ingo

