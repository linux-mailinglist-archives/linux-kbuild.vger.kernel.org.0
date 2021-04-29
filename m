Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE9236EDDE
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 18:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbhD2QJz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 12:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbhD2QJy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 12:09:54 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A9FC06138B;
        Thu, 29 Apr 2021 09:09:07 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id t94so25952802ybi.3;
        Thu, 29 Apr 2021 09:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=EorVpKZRsSllfeM/atRN+mOPQqPmnCQhK0yD5RMKMnA=;
        b=exMuXEFq9Lpu/2kRoWHVpmM7ZORD3azlEFRlEW56srfpFL10owsUofdBPuebOH1rBx
         88aIZBFdeiDK/TDk3SHfpJIh1VlyTUComYGSL72pwi3iLnVxN63ojBV0MvqFW9jfcvyp
         g7mislbiqp9ZMwNnvGEzsvYc0m9Ox0MrZWS7cvsYzXsZJunqcBYIf5W13QaW3F7LwNHe
         lbK2ROp7jIQtHbej1CNSqOYKd5X+vzCfZ4Ho0XFR6lHI9sRvlmdq+qZSYU0ulJN3qpjP
         5hGxYFwzwB09OXw+PJgloc8MqYhGBpJgL6K3tkuTkhHV13D0hXqoi2B6enADQm6v4INr
         5FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
         :references:from:date:message-id:subject:to:cc;
        bh=EorVpKZRsSllfeM/atRN+mOPQqPmnCQhK0yD5RMKMnA=;
        b=TKz15QXqjrMpNGHJ/CZRnauVTUV6o+i8eQwHyMTRQ1pk2b4arsIvBlEjmW/8O54uKn
         iC0s8kbdcN6av2TAOIdPtlL73jqbJYFbhV8wS4z5oy6K/+0h9QXLQPTJBxk6P+6WBWi+
         MAfMHvqBfb1EFhSttRNEys/ymJZzdW8TChh8u6KTKH+Cjmgd1OYWqaJVIsPyrM2sEjD2
         DwP4q2WdY51GL8yFgJNfFs8gmpXueoWKtET6Zd7EzfwZHnHQ5/nb4eLqXuWCNosQ32PF
         5r7At0q7dPuRIljhRKGgQwEA85VG1UwVp4L7TioCYpNPi9IAeBdPO7g6yq1n6P8x10VF
         oOgg==
X-Gm-Message-State: AOAM532DLHYQvjQJ3SuCSeK+fCeFvNo54FuBwqAv+znCT/HMqgRRL+E9
        /5yo9bW3npqkl0p4aCrJ1EskPOInta+X0xbFjUpnSxAprQI=
X-Google-Smtp-Source: ABdhPJynyvLEYvj+6ufROnCezJtu6jzpTD3l/8sqOWhT9EvJTeDx42OofxLLatDsyHV5kYj3HJC/YzB9Q6yWGQZBRsM=
X-Received: by 2002:a25:aa2e:: with SMTP id s43mr277929ybi.189.1619712546708;
 Thu, 29 Apr 2021 09:09:06 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mceier+kernel@gmail.com
Sender: mceier@gmail.com
Received: by 2002:a05:7010:7651:b029:ab:612d:7d1d with HTTP; Thu, 29 Apr 2021
 09:09:06 -0700 (PDT)
In-Reply-To: <YIrLZ8Siip0C0d9b@zeniv-ca.linux.org.uk>
References: <20210414184604.23473-1-ojeda@kernel.org> <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com> <CAJTyqKOEG1tF0YGOvNeyidjF+2MaXoY5kCo9-cZ4Ri_Jb8XV8Q@mail.gmail.com>
 <YIrLZ8Siip0C0d9b@zeniv-ca.linux.org.uk>
From:   Mariusz Ceier <mceier+kernel@gmail.com>
Date:   Thu, 29 Apr 2021 16:09:06 +0000
X-Google-Sender-Auth: TYi__oyZ27nAx95qHM9-WZ2MPLI
Message-ID: <CAJTyqKOwxL8xGCtz82qdC563gjCduxag88MLo2M+OVhQMahzsQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Kajetan Puchalski <mrkajetanp@gmail.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 29/04/2021, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Thu, Apr 29, 2021 at 02:06:12PM +0000, Mariusz Ceier wrote:
>
>> > You must cause any work that you distribute or publish, that in whole or
>> > in part contains or is derived from the Program or any part thereof, *to
>> > be licensed as a whole* at no charge to all third parties under the
>> > terms of this License.
>>
>>
>> The issue here is, non-GPL tools enable development and distribution
>> of GPL-compatible yet proprietary versions of the kernel, unless I'm
>> mistaken.
>
> And?  For your argument to work, we'd need to have the kernel somehow
> locked into the use of tools that would have no non-GPL equivalents
> *and* would be (somehow) protected from getting such equivalents.
> How could that be done, anyway?  Undocumented and rapidly changing
> features of the tools?  We would get screwed by those changes ourselves.
> Copyrights on interfaces?  Software patents?  Some other foulness?
>
> I honestly wonder about the mental contortions needed to describe
> something of that sort as "free", but fortunately we are nowhere
> near such situation anyway.
>

Equivalents are not a problem - they can exist as long as the
distributed source would be buildable with GPL tools. I was thinking
that adding a requirement that the distributed kernel source should be
buildable by GPL tools would be enough to protect it from proprietary
extensions. But maybe you're right that this is unrealistic.

> I don't like Rust as a language and I'm sceptical about its usefulness
> in the kernel, but let's not bring "gcc is better 'cuz GPL" crusades
> into that - they are irrelevant anyway, since we demonstrably *not*
> locked into gcc on all architectures your hypothetical company would
> care about, Rust or no Rust.
>

I don't mind the language. I'm more concerned about featureful rust
compiler suddenly being developed behind closed doors.
