Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A953620D0
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 15:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbhDPNVB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 09:21:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:42260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235361AbhDPNVB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 09:21:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7725261003;
        Fri, 16 Apr 2021 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618579236;
        bh=Wi/nLQgcn/JH9WXBh2E48up7ZmjmYCgAyJbsb8cnjhU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1LuNiiCLcb4ktgUkDnBBapxHecDoi5oh56ZAOAi4Iqa6pZvQh0UJfDDURu+hxtmsO
         /Ave1zJZUXipPd5pThy8mcZoI4fdkhoZF8hRu7pichW1BMdreZh2kah60sarZmtBB4
         q6uh0dRuf6QF1AKDWUiFs+spApSb4+1PfevFKiBY=
Date:   Fri, 16 Apr 2021 15:20:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
Message-ID: <YHmPIY+SvHXbFZM3@kroah.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com>
 <YHfm+tCYp+I1C5I/@kroah.com>
 <CAGngYiV3Q336QLwZ_PjDj9hd+Y4uMjhq209ppYYqc_QeegLvgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiV3Q336QLwZ_PjDj9hd+Y4uMjhq209ppYYqc_QeegLvgw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 09:07:10AM -0400, Sven Van Asbroeck wrote:
> On Thu, Apr 15, 2021 at 3:11 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > I've been talking with the developers here about doing a "real" driver
> 
> Would it be beneficial if the device h/w targeted by the "real" Rust
> driver has QEMU emulation? Perhaps in addition to physical silicon.

Again, as was reported, a nvme driver falls into that category today, no
need to look very far.

thanks,

greg k-h
