Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771BC150EAF
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 18:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgBCRfa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 12:35:30 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39419 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgBCRfa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 12:35:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id o15so9996833ljg.6
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2020 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OG+6B41kuMUO4MlgmmaIjJFesunEaxv6J793bDCq9tA=;
        b=JxadzzTrcUsyEnMxTTvf/OPUdgp68RyYoD7xlWF8FCfOh7XpGYzkaGtj5IzoN9XI9Q
         R/+BlPWCfdGWYQFT8eCrZnolA9DxzM2Zc1tp+Id3cDfTJYJJJvpHe3axYVbjW3ApcL+t
         9uPabRgCZ6k19Q3NlXKP6bhqbpKo7RE38E9rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OG+6B41kuMUO4MlgmmaIjJFesunEaxv6J793bDCq9tA=;
        b=XpcpjXXjOJDvVWln0SKBqutmYGVa2Wvm646aTpHwBP9bfDOE9sU9NYMskvm9Ppt6yb
         TAN9rPcTXZya3ISzMhufh18cypLoFJKjHa7Fv95kVYF4+NYTA8RwrNVz6iykF4Ft64+d
         OPbn3Q325H5galf890S2EqUo3s8qQvL3FsWNCqK85tToAgVzFtSmPYd09xhLmH5R+vpP
         0pAQFifxY1fhJ7QVRv2utiKQla7pNFlZzzqivKh6nCaZKOBiG64k8Ab2n2DMtoqByRox
         G8MdiXOnJX7TB4faOap5hfPTQFKTzfiShkLKa/xjEAxTijBEwscDBZ87p48PXScgUxPq
         qDbQ==
X-Gm-Message-State: APjAAAVnQMj9Q2sA5t7c7dZd/X4l2XfMt/LcziiZI9hDJ5Ey4ke64Lzw
        WR/JTmaolzNGy9yUJPSmLV0bNcPnDB2Pkg==
X-Google-Smtp-Source: APXvYqxC4ql6uHwsp+BFA362tnlaWCuU2qFEJBRAJhqfbKxgZHAsWh10N4J2hdpO1RDq1IcppjqIHw==
X-Received: by 2002:a2e:b5a5:: with SMTP id f5mr14107769ljn.162.1580751327384;
        Mon, 03 Feb 2020 09:35:27 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 11sm10264042lju.103.2020.02.03.09.35.26
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 09:35:26 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id v201so10268255lfa.11
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2020 09:35:26 -0800 (PST)
X-Received: by 2002:a19:c82:: with SMTP id 124mr12458719lfm.152.1580751326085;
 Mon, 03 Feb 2020 09:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20200203164708.17478-1-masahiroy@kernel.org>
In-Reply-To: <20200203164708.17478-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Feb 2020 17:35:09 +0000
X-Gmail-Original-Message-ID: <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
Message-ID: <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 3, 2020 at 4:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This commit hides the Kconfig choice in that case. The default cpio
> is embedded without compression, which was the original behavior.

Btw, is there any way to figure out automatically what the initrd
compression is (for the external case)?

Because I think it would be lovely to be able to have sane defaults
for the CONFIG_RD_xyz things.

I'm assuming the answer is "no", simply because it comes from distro
installs, but I thought I'd check.

                 Linus
