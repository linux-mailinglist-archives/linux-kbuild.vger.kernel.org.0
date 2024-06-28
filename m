Return-Path: <linux-kbuild+bounces-2283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40A91C56A
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 20:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 900B5B22579
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 18:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37251BE843;
	Fri, 28 Jun 2024 18:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuBWd4bX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC11B94F;
	Fri, 28 Jun 2024 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719598031; cv=none; b=N+MLZTG7Kn4UcoIyNtQ7UJEW91PD3stfXTxDDeI8v4ghNquef16zjbFdBuAhgTKuomU26CNnsKfR8V9VO2/DV5H39TZ9jgj5FDz7wH1zuvHnzN3W04OczfumC2ukZfeVI/L48b3xR7+fARtoRGD8Q2khC1k3hTc7rdSqoCoBOZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719598031; c=relaxed/simple;
	bh=EMbVzbnsLSmtwf7hpcQDvwkGp+gUbKkbpsvhQ6740Jo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=lb0qE+cPgO4Nv6WRkGLFOrKLtcpgaWsRJQKBL3kjD5MbyFHPZxBb51Tvp3+U8PTygqOmaXpISnyWVdKQbQI2GX414KUhCilSYSGk6XFIiVbrrhe7c9EBopyp5R/DDeV92eWxJ1kpJ5P29nPqYkQ+trKTfJCcY/HmhxSvF5wtuTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuBWd4bX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so350114a12.1;
        Fri, 28 Jun 2024 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598028; x=1720202828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EdFRuIjAMdYahk4Kci0WZzTsWWkZ1bOHj3GXMpTCuY=;
        b=kuBWd4bX2XPaqgSDGCr1UaTEJWMC9Eylv5MoJcrMnAY6ZT64zvO4eFrz5mHt2M74rc
         cUwGDJBAHgoXzvstknjO6EJiCnHZ0bR6ifSxkwa+fdE36LgOHA5XD2n75tn/HuP4hFcS
         uj0zJRg5PNJ5IFpnkVhrJsywC00lrUt/2r50+1iVLyA9qBRWxmyLAGBY99j9bPGoiPY+
         Y4wcgcmGbNwW48PNc0mgcSGF7j20VFuWpxczBhNvizPu4aDXSVOyeURisqHX+bDTs63J
         lJKC+uOTSqRUJPsfB2XBu/1j+tfRBQXmz1QJoWFFTVmLcH5obdhq2Q+Vir14Ww6yN7D/
         +4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598028; x=1720202828;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8EdFRuIjAMdYahk4Kci0WZzTsWWkZ1bOHj3GXMpTCuY=;
        b=gcCSIkBnRFuVoV1YQIvCVs2pD0uyF2L+1CLy9uRij+fn8Qv/RU7CEMWYcwcWlmn96a
         lUwp6YIuKKCp1JjusXZ0nkbY4fVYCFI7ZM+2xtW549UdriqqtgfuYBVnRm6k2Ini2p4G
         yUoo9m9PNP77rM81/pQ2zMFHjWCmAUk4n4jxuXPn6kB+E/sb85JOmSYnvCG0jrxNh9iO
         vYYK8LUCkud6wLLVmwVmCDj7ikkpHMVujHpX30H9tid3YQkTYmd70zAuXaNfj1TniuAg
         G+/6r7OZzcgkElILnjQle8XfxblziREY9x/wCef9lK+NftBilDbaLMGnQntAVPNojtTR
         7LkA==
X-Forwarded-Encrypted: i=1; AJvYcCVJMPigF/teWLFkN2mf7cKK/+29jHcTFm0du3faY9v4HaHtimusBDTJTj3PEzqZESkQ5E8TDhfbFq5MJYGw3Vo8uzWq51e53LqXzsoyiRqPNAg9eLoddxCmKPRnmCRcP1f9QahQyqagrUM=
X-Gm-Message-State: AOJu0YwkVz7/Ma82RZkvHNoZvJrXMDiISUMWQy+vWau2SKd6QfW34Klp
	kUnDaBtzrVeerdG8chWjkVfHbj8+F0OaYv993RY7Xj/4oe0zuyDyhZNKoA==
X-Google-Smtp-Source: AGHT+IEl1RM1Aavl6HBjqIB0gZ1mW30dOcVOnvOK4VHVcakerUJ4rmBQ6+rZkKMOWDndnw9kJKXR0w==
X-Received: by 2002:a05:6402:22e3:b0:57c:ff0d:b781 with SMTP id 4fb4d7f45d1cf-5865d4737cfmr1703648a12.16.1719598027336;
        Fri, 28 Jun 2024 11:07:07 -0700 (PDT)
Received: from [192.168.178.20] (dh207-41-166.xnet.hr. [88.207.41.166])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c83534sm1308168a12.10.2024.06.28.11.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 11:07:06 -0700 (PDT)
Message-ID: <bc73207a-4b52-423d-833a-fb2a4221a5bc@gmail.com>
Date: Fri, 28 Jun 2024 20:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: [PROBLEM linux-next] drivers/hid/hidraw.c: error: cast from pointer
 to integer of different size [-Werror=pointer-to-int-cast]
To: linux-kernel@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

While testing randconfig with vanilla next-20240627, the following KCONFIG_SEED=0x14021E00
gave this particular build error:

drivers/hid/hidraw.c: In function ‘hidraw_send_report’:
drivers/hid/hidraw.c:143:63: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  143 |                 ret = __hid_hw_output_report(dev, buf, count, (__u64)file, false);
      |                                                               ^
drivers/hid/hidraw.c:154:56: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  154 |                                    HID_REQ_SET_REPORT, (__u64)file, false);
      |                                                        ^
drivers/hid/hidraw.c: In function ‘hidraw_get_report’:
drivers/hid/hidraw.c:231:56: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  231 |                                    HID_REQ_GET_REPORT, (__u64)file, false);
      |                                                        ^

Apparently, on this architecture, sizeof(struct file *) != sizeof(__u64)?

→ 105 static ssize_t hidraw_send_report(struct file *file, const char __user *buffer, size_t count, unsigned char report_type)
  106 {
  107         unsigned int minor = iminor(file_inode(file));
  108         struct hid_device *dev;
  109         __u8 *buf;
  110         int ret = 0;
  111 
  112         lockdep_assert_held(&minors_rwsem);
  113 
  114         if (!hidraw_table[minor] || !hidraw_table[minor]->exist) {
  115                 ret = -ENODEV;
  116                 goto out;
  117         }
  118 
  119         dev = hidraw_table[minor]->hid;
  120 
  121         if (count > HID_MAX_BUFFER_SIZE) {
  122                 hid_warn(dev, "pid %d passed too large report\n",
  123                          task_pid_nr(current));
  124                 ret = -EINVAL;
  125                 goto out;
  126         }
  127 
  128         if (count < 2) {
  129                 hid_warn(dev, "pid %d passed too short report\n",
  130                          task_pid_nr(current));
  131                 ret = -EINVAL;
  132                 goto out;
  133         }
  134 
  135         buf = memdup_user(buffer, count);
  136         if (IS_ERR(buf)) {
  137                 ret = PTR_ERR(buf);
  138                 goto out;
  139         }
  140 
  141         if ((report_type == HID_OUTPUT_REPORT) &&
  142             !(dev->quirks & HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP)) {
  143                 ret = __hid_hw_output_report(dev, buf, count, (__u64)file, false);
  144                 /*
  145                  * compatibility with old implementation of USB-HID and I2C-HID:
  146                  * if the device does not support receiving output reports,
  147                  * on an interrupt endpoint, fallback to SET_REPORT HID command.
  148                  */
  149                 if (ret != -ENOSYS)
  150                         goto out_free;
  151         }
  152         
  153         ret = __hid_hw_raw_request(dev, buf[0], buf, count, report_type,
→ 154                                    HID_REQ_SET_REPORT, (__u64)file, false);
  155 
  156 out_free:
  157         kfree(buf);
  158 out:    
  159         return ret;
  160 }

Thank you very much for examining this bug report.

Best regards,
Mirsad Todorovac

