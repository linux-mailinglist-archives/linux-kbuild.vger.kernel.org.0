Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3620836EC31
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 16:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238595AbhD2OOY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 10:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbhD2OOX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 10:14:23 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EDCC06138B;
        Thu, 29 Apr 2021 07:13:35 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 26-20020a05600c22dab029013efd7879b8so9570177wmg.0;
        Thu, 29 Apr 2021 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rixzT4B1KAAKcd3h0t8hYsII2C1zsLRX8iTNWsf0g8=;
        b=SlNkVNa9WY+p38id+ZUpEWa3+04Fs1ksNp2uWDj4F6tGPMY9cJaSFeIum+ML0JGqrw
         us1GACHx73MJbuUqfz99qA4n9hWrx3OUJzAMeQZeNtGnLBSjeTvC4r6MCYzAooCzg00b
         P7bA6PNzaZPs8A619SnuvecOuGcmoGKZ2fsWWdPJTKwyreAOK1CsUkV+tRRZXTOp1ScZ
         qNu9j8lzRAnm+peDx2AgXvtic0Exm1FQZDZK9IcHs8rO3U4K3UQQIasSyblkEn6a9av4
         NTZMb7QcivI+LWNM1pjwI94Pxmr4tCl+s5CZBC2jlFl0fcY6voWzHTpfZf516aEYEVxM
         Fcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rixzT4B1KAAKcd3h0t8hYsII2C1zsLRX8iTNWsf0g8=;
        b=mAgRawQfDMu5um+o0vbxgT6niAwc2qxj/7W0TtJirkr0JJZs+bv3QS1rIE6iH/pWpd
         HidC1Akw2fIyH+XSX35IQpwh6KW9BXWGuIadKDulFSAvegBgV5kKEDA2P+oc40wr/P3d
         B5zKqg/4en/MEniHuZCNXSxda5aMeg1JPRkcYhFwtH5Tgfs5dQkBVTRN1baNlIoO7GWJ
         Jk7hIyq0ft8FS4hMWJkgqiYHzBFq1Ok69jBPUBWVG3WP27j7iZX+EMdQ4QEUbNBsAeCY
         Xx2rHbPDoVwx9ehrDFWGVz48Jf94Wcuzj9FikErH1rKdlCsia9ealQ0CwpEP7wgPzF3c
         54nw==
X-Gm-Message-State: AOAM530vheAI9eoS+rSFonAEsrBsHQKcjTzofDLA+MQyrhLRtbxDQHlS
        5snh0FIR7PTYJKOGiLfpI/brYA3u+HSv4YxRn0w=
X-Google-Smtp-Source: ABdhPJwOQrIh7CBQq+wWKHUpQhidWUWhX4DmgUlp1+WHgX848yi6EVenXqGOm1apOvzUoBofOv2QFnqAoIa3q6it4Dw=
X-Received: by 2002:a05:600c:4a19:: with SMTP id c25mr230132wmp.94.1619705614413;
 Thu, 29 Apr 2021 07:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com> <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
In-Reply-To: <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 29 Apr 2021 10:13:23 -0400
Message-ID: <CAGngYiXCui0iGW0890BMDUrTkgRe5HQNuiEyEbf=NdvFe06eug@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     mceier+kernel@gmail.com
Cc:     Kajetan Puchalski <mrkajetanp@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 29, 2021 at 10:06 AM Mariusz Ceier <mceier+kernel@gmail.com> wrote:
>
> Let's assume the hipothetical corporation wants to add some
> proprietary stuff to the kernel and avoid sharing the code

Wouldn't Greg KH be itching to remove such patches from the kernel? If
they made it in, in the first place.

GPL is a necessary, but not sufficient condition for code to be merged
into the kernel. AFAIK the kernel community has the absolute
discretion to refuse any GPLed code for any reason.

IANAL.
