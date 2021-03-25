Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35BE34921D
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 13:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhCYMf1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 08:35:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230307AbhCYMfO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 08:35:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D673F61A13;
        Thu, 25 Mar 2021 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616675706;
        bh=S6IiEuKfnnQgMI1r6mPlv0/NVknqo7eQgedfIkBb3bM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PKwDInaAa0TErUwMAYd5l085xmCfZHYzS5tSVmjwpYgsWHfhG6wUt5KRSyBJLVvju
         Fl9C6xxz5jRGIVPTCptQNMIzvGNPcJyvSm+bIZchXguKG0/XHLICrPSrtoGUgkM70L
         pXUNhCRxhW0+uJAaNUteqArKzRUEK8Mw14le7GRov8pbJ+krAOmY01eDRAAjKioxZ/
         rCXg/oJUv6iDpapvYn0SRJv38HzhnHGBAAPWtp+OsjKBTvIwLfY0I/s8f/UHDyrMKL
         pXgpdhgJ4UHASsOqgDypOornywRuB82WhGIdtGLLRkVkuanKsv37Z/d83VRnBc0cQ1
         xw5ZcJuaJEeLg==
Date:   Thu, 25 Mar 2021 13:34:59 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3] docs: experimental: build PDF with rst2pdf
Message-ID: <20210325133459.312d8ff6@coco.lan>
In-Reply-To: <e44c1b82b38a8568af1d38ee09edb46517f03ec2.1616675031.git.mchehab+huawei@kernel.org>
References: <e44c1b82b38a8568af1d38ee09edb46517f03ec2.1616675031.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Thu, 25 Mar 2021 13:25:56 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Add an experimental PDF builder using rst2pdf.
> 
> This extension is only enabled when "pdf" builder is selected.
> So, it won't interfere with normal documentation builds. I opted
> to not add a try..except block, as the message is already
> good enough if one tries to do a "make rst2pdf" but the extension
> is missed:
> 
> 	Extension error:
> 	Could not import extension rst2pdf.pdfbuilder (exception: No module named 'rst2pdf')
> 
> This won't affect "make pdfdocs", as it uses the "latex" builder
> instead.

Please ignore this. Sent the wrong version.

Thanks,
Mauro
