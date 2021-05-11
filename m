Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C98937A79C
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 15:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhEKNcb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 09:32:31 -0400
Received: from codesynthesis.com ([188.40.148.39]:35116 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhEKNcb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 09:32:31 -0400
Received: from brak.codesynthesis.com (unknown [105.226.87.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 661EA5F6C6;
        Tue, 11 May 2021 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1620739883;
        bh=YuyqZeInymTQvuLIYY7RhauhXHSbzx2AVQDQQc55/4M=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=0syrEJxPQuRY4nuDVLATNw86q0c3mJ/FGPbAAwRylpEtd6XMTOwH/8ksvdThgolEo
         iA+dRtToJO1OZakGNqbf3D66wKd7B8ILy4PXX4eHBSLtEBazH4gsC4oFJYEwvpLLVM
         aMT4uHt2PVQJFVA7qF8Lq7+9bPHYb5hllj9/5e/SYHX9+ld5fea9iTnGeQJbegylQj
         jk5fQ6ajqI713fKMy/Sa9LymxUq+HBA7iniJ5lVKeLOqwvreAvJ9e25EZofL500b5D
         pobIPSWZb57vQOrW3uXXDPBLAPSed/eSLzDvkjP1uKfKG70ifvUr79oZ5LrmrTJcKf
         XiUafN7agsDdQ==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 700471A802C0; Tue, 11 May 2021 15:31:18 +0200 (SAST)
Date:   Tue, 11 May 2021 15:31:18 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Christian Melki <christian.melki@t2data.com>
Cc:     linux-kbuild@vger.kernel.org
Subject: Re: [PATCH kconfig] Add annotation symbol to configuration handling.
Message-ID: <boris.20210511152714@codesynthesis.com>
References: <20210509155138.24670-1-christian.melki@t2data.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210509155138.24670-1-christian.melki@t2data.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Christian Melki <christian.melki@t2data.com> writes:

> While maintaining various projects and kernels, I've often found myself
> thinking "Why is this selected / configured?".
> 
> Sometimes I'll find information in a disjunct documentation system or in
> the head of somebody else. But most of the time that piece of
> information is just lost. Configurations get moved from various
> repositories, so that type of disconnected information also gets trashed.
> 
> It would be nice if the configuration supported some form of simple
> annotation to variable mechanism. Ie, part of the actual config
> (only during read / write) and not just a whashed-away comment.
> 
> $ grep ANNOTATE_ .config
> ANNOTATE_CONFIG_TRANSPARENT_HUGEPAGE_MADVISE="Always was causing issues."
> ANNOTATE_CONFIG_HID_SENSOR_HUB="Plus IIO for the Realsense camera support."
> ANNOTATE_CONFIG_HID_SENSOR_ACCEL_3D="Used by Intel Realsense camera."
> ANNOTATE_CONFIG_HID_SENSOR_GYRO_3D="Used by Intel Realsense camera."

Just to confirm my understanding, these annotations are expected to be
added manually, correct? The proposed patch only makes sure they are
preserved during the configuration read-write cycle.
