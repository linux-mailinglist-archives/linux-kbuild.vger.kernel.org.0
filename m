Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3DE124F19
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 18:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfLRRX7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 12:23:59 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33838 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfLRRX7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 12:23:59 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so2289986lfc.1;
        Wed, 18 Dec 2019 09:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5YLh+jNfVM6LWeMoJMu0ZClJUPg52a33rYtudsvVwjU=;
        b=P5r5q7vKzoxV+yMSLMoYym22i4iMeFUxtaN8efSrF3k6DoZ8IclhnxZSEZVextw7Rk
         eokBSrTSW8sWJ74NTdK2QMpkCwlp8fQxsZaKE+aXb2W+TJXXw5lwiZ47lTkcm6/bdxrA
         ztQBvOpoJAYFbUoj/9PMiCfIAKM6ogkp+OdMN7K89X+NmoBFpacCOlYGP8lewYqz6ND1
         RztBZiLYmKYrdrDFpjILXH1S/jteCrw2tXKvqEVBMCTE6k8HUHpxQOWYhCI97oGkIIRv
         Wm1mC5dbB99JQQCeJe6HdB063q/TXu4P3sjXAJJB79BoUlMZwPBE1pLv7oPNktYRFkzB
         DJUw==
X-Gm-Message-State: APjAAAXXAWVS5UNSMU1nLOCo8XRBkJxJ5vdWZQBl9yIWMYrJfCv0TdZV
        2Ue/MlkaLhmy+muWlhtQUnc=
X-Google-Smtp-Source: APXvYqwkbT/1LtvkNxZq6jxP6RFQVOyOY3QtX/S6r+C3fBddKq/hgi1WUOonvolKS35U0uhsjeiQFg==
X-Received: by 2002:a19:8456:: with SMTP id g83mr2538970lfd.0.1576689837150;
        Wed, 18 Dec 2019 09:23:57 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id r2sm1454722lfn.13.2019.12.18.09.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 09:23:56 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ihd3B-0006mq-EF; Wed, 18 Dec 2019 18:23:53 +0100
Date:   Wed, 18 Dec 2019 18:23:53 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        kbuild test robot <lkp@intel.com>,
        linux-kbuild@vger.kernel.org
Subject: kbuild obj-m directory descend (was: Re: [PATCH] serdev: fix builds
 with CONFIG_SERIAL_DEV_BUS=m)
Message-ID: <20191218172353.GO22665@localhost>
References: <201912181000.82Z7czbN%lkp@intel.com>
 <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 18, 2019 at 09:38:42AM +0100, Uwe Kleine-König wrote:
> Commit 54edb425346a ("serdev: simplify Makefile") broke builds with
> serdev configured as module. I don't understand it completely yet, but
> it seems that
> 
> 	obj-$(CONFIG_SERIAL_DEV_BUS) += serdev/
> 
> in drivers/tty/Makefile with CONFIG_SERIAL_DEV_BUS=m doesn't result in
> code that is added using obj-y in drivers/tty/serdev/Makefile being
> compiled. So instead of dropping $(CONFIG_SERIAL_DEV_BUS) in serdev's
> Makefile, drop it in drivers/tty/Makefile.

I was just looking into this when you commented on this off-list.

The offending patch is broken since it effectively makes
CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reason
those symbols do not end up in vmlinux (despite being compiled) when you
add a built-in object goal under a directory that was entered using
obj-m.

That seems like a bug to me and contradicts the kbuild documentation
(3.6):

	Example:

	#fs/Makefile
	obj-$(CONFIG_EXT2_FS) += ext2/

	If CONFIG_EXT2_FS is set to either ‘y’ (built-in) or ‘m’
	(modular) the corresponding obj- variable will be set, and
	kbuild will descend down in the ext2 directory. Kbuild only uses
	this information to decide that it needs to visit the directory,
	it is the Makefile in the subdirectory that specifies what is
	modular and what is built-in.

I tried adding other targets to obj-y directly and they are also are not
included, seemingly since the directory was entered using obj-m.

Masahiro or Michal, can you shed some light?

Johan
