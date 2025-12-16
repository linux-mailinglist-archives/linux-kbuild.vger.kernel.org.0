Return-Path: <linux-kbuild+bounces-10121-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C900BCC51BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 21:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0509630203A0
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 20:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648F128030E;
	Tue, 16 Dec 2025 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5dgvygy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47330243951
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765917548; cv=none; b=mB5kK+XRaJLrjNn7ejXiB+OL2nlTzxQL0j9Z2kxkEapBBsyOSyiaoVUTAblvHTaNiAINE8lMSYX+dgODIezcG1WxP+K/NaXsrsj9b6fP7BCRXQfTpimajVZKlKlGCRGDnR6vpZnjjb1JZnCI4XwbIxBxHVNpeSuDIrQFonIeSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765917548; c=relaxed/simple;
	bh=aYqKKOVjq6oWpqXE5abfEhtBPEs96Tb+JHl7AKp9DQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxVdRvyR3HHCewM2vcXwnCEbqg8n0rNn6Bl/Zl9oCbglnXSbvHnhjRxyx8subztVNRrZeA2oUi9p69pgT7omxiLeFbuxobSidiJZcGfv9cRvrnOViXGiks+K+FJDjxfursSFU8fbwcOEMosFAWLdDVMv/Cs9eEz9JQpXhFZg9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5dgvygy; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee0084fd98so43786241cf.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 12:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765917545; x=1766522345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zoGDiQfxD9HPuzfsGD+JnrbWhDm0NzDpncYf7nR8940=;
        b=m5dgvygy8/PaisFW39IGZyDdoq7kq+4LojLzsTn3MCjmid+CrM3s/NPYmn+CMwhIYb
         A6I1T8ayVl9GnJudhK4++e4+2WU8pj1yfJ+vTF4MH2bOcs8zv/QRc3G+iqQvIeD4AQTi
         6lRwf97f9f1uEy+UKNCOKR6hNRdrmym2jxJXJBuQFj6Ze1ib1uMThux+1aOVWDYIqKBN
         B5Rl08Gjvfy6PG7iDGxY53DcsxlHoozjCTiNMejNgnK+ye4rQJdJpGvFKdQJGD7qlzMU
         51yMSXW6Wp7gHOSxUJ+iVRUvOsGficaSkUnDYew0RJ96QPnU6YqTakhGjKPKmZknB52d
         nc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765917545; x=1766522345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoGDiQfxD9HPuzfsGD+JnrbWhDm0NzDpncYf7nR8940=;
        b=aImQlQmiQ4s31fLV8ge3+TPHArNxOhz41fqoF5Tc9XRnDC3QXymTbt5rgvxcWj43EI
         1Sn6wPpOUWPoYawH28GXtVk2j4vUBWMLZws/Q1J0AvkTUxt0+F6u5cc/RHLAP4ILuEdu
         wUcpc4DOFP6thh4ljA6t/bqDfBzvuyBGjeXNpPwW78odXYAPay+TD6MdZnkg3LX5hHhI
         UpR3Lg4zLEk458/bUW1yUjVVzp5f9W14EoTDbQPcKwrvwBToUtqXO6rj8THj1iltNGl0
         TPJ+ejmeenysHqe0Y6hWVRYI4HuZu0WXIKFSOdhIphESkoz4WnxxSR6HuUrj/Zey9TF3
         DMRw==
X-Forwarded-Encrypted: i=1; AJvYcCUbUXzNGewol7XW2lGG4LT8uu+P1v51fuwZ8famjQrvoGXS336UXsJAnXhL+NDx8mDl6GDrLdgz/zgIUBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQErBXzlW+svecBro+SpPDPzUPV/HKAcE2C3XUOaDcOZS2ZLA
	2XQOng4bcPMYJc+MGRI9BOsSmCzUPDBc2/viybjNi7Cx8jbmGiEGxfZWwcI6/A6kYzB3i+4ESgS
	vo239NdO7sO380jGTGkvV1nIgwio6oxc=
X-Gm-Gg: AY/fxX49qZvB9ZBtaTG5aCq3dznwO3o24+dCDlwhLjywTLRcrEtso94zldSMDMtHmCF
	xjy8R/G6fWIFkmXtjsXtnY/dCHZWlSLpsKjPwZovKVsOZiZFqgWoAfltJDl9C/EXUmOznm9+Pah
	yDrKDNwzOl+kvBQCzTbsn+94TSYQOvaKCH8BGAkMsCnIN1Xi6s3NV3N8Z0louYk5hSqkL6P3ruk
	2j4+FVo/+ZmEUxh4dugeR+MFdZcsnYgmXDOG1HTBBOT3N06RzZsbkUtfAvfTOebpQikiPGt
X-Google-Smtp-Source: AGHT+IGLR6nOgJdIMMFM5KUFTdOTl7OpgwE/M3vyOzYCn9jVPxt9qZmfBbwQs/d7Ipd0BfbdjqlxmSoawnovVFLVxJ0=
X-Received: by 2002:a05:622a:5a13:b0:4ee:1563:2837 with SMTP id
 d75a77b69052e-4f1d0626046mr218569221cf.67.1765917545050; Tue, 16 Dec 2025
 12:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213140923.19710-1-rostiprodev@gmail.com> <20251213140923.19710-2-rostiprodev@gmail.com>
 <35baccd7-bcb6-4794-9b6e-ce5982bd2342@infradead.org>
In-Reply-To: <35baccd7-bcb6-4794-9b6e-ce5982bd2342@infradead.org>
From: Rostislav Krasny <rostiprodev@gmail.com>
Date: Tue, 16 Dec 2025 22:38:54 +0200
X-Gm-Features: AQt7F2o1iCw_ICizj_7fJYX6GhLVUux_9BmambU-pUms9mymvTPm8kKxd2WTQnw
Message-ID: <CAKU3Xk6H0V2W2sEwfWZMrfJ11j5MvbhX34rpos1OfyA=zHoWfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] kconfig: move XPM icons to separate files
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Dec 2025 at 09:10, Randy Dunlap <rdunlap@infradead.org> wrote:
> This worked well for me when I ran 'make gconfig'. However, when I tested
> 'make xconfig', instead of having icons/symbols for
>   Back, Open, Save, Single View, Split View, Full View
> I have words as listed above.

I've double checked my patch again with the latest master branch of
Linux and "make xconfig" works properly on my machine.
Here you can see the screenshot: https://ibb.co/Q2jX9tQ

I use Fedora 43 with Cinnamon DE. The Qt development package that I
installed is qt5-qtbase-devel version 5.15.18-1.fc43 plus its
dependencies.
What version of Qt do you use? Did "make xconfig" work properly before
you applied my patch?


BTW if I install qt6-qtbase-devel (currently version 6.10.1-2.fc43)
instead of qt5-qtbase-devel it fails on compilation, but this is a
completely different problem that existed even before my changes. I
will try to fix it later, it seems like a wrong include path.

$ make xconfig
  HOSTCXX scripts/kconfig/qconf.o
scripts/kconfig/qconf.cc:7:10: fatal error: QAction: No such file or directory
    7 | #include <QAction>
      |          ^~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.host:148: scripts/kconfig/qconf.o] Error 1
make[1]: *** [/home/huligan/develop/linux/Makefile:742: xconfig] Error 2
make: *** [Makefile:248: __sub-make] Error 2

