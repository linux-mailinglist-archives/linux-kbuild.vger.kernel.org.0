Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9FC361F0F
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 13:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241048AbhDPLqg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 07:46:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49128 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240598AbhDPLqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 07:46:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrewsh)
        with ESMTPSA id 44BED1F435B8
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CANiq72mpjQh01QovUPCjdHDS-zVHroxymet67GOHvotW8wGdVg@mail.gmail.com>
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora
Message-ID: <dcaca535-2df3-3224-82c3-1a49a2208f30@collabora.co.uk>
Date:   Fri, 16 Apr 2021 13:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANiq72mpjQh01QovUPCjdHDS-zVHroxymet67GOHvotW8wGdVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 14/04/2021 21:42, Miguel Ojeda wrote:
> On Wed, Apr 14, 2021 at 9:34 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Honestly, I'd like to see a real example. This is fine for testing,
>> but I'd like to see something a bit more real, and a bit less special
>> than the Android "binder" WIP that comes a few patches later.
>>
>> Would there be some kind of real driver or something that people could
>> use as a example of a real piece of code that actually does something
>> meaningful?
> 
> Yeah, we are planning to write a couple of drivers that talk to actual
> hardware. Not sure which ones we will do, but we will have them
> written.

I’m curious what’s the procedure and approach in general to adding new
APIs? I was thinking of trying to port my driver but it needs USB HID
and either LEDs or hwrandom (depending on which part I start porting
first), so obviously it’s not doable right now, but I’m thinking about
maybe helping with at least some of those.

-- 
Cheers,
  Andrej
